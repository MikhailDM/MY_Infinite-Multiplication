//
//  PlayViewController.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
//MARK: - VARIABLES
    //Переменные для таймера
    var timerTime = 0
    var secondsPast = 0
    
    //Закончилась ли игра
    var isOver = false
    
    //Текущий счет
    //var currentScore = 0
    
    //ТЕКСТ
    //Начальный текст поля ответа
    private let startAnswerT = K.InputSettings.startAnswerText

    
    //НАСТРОЙКИ UIALERTCONTROLLER
    //Фон UIAlertController
    private let alertBackC = K.MyColorsUI.white
    //Цвет текста кнопок UIAlertController
    private let alertFontC = K.MyColorsUI.blue
    //Тексты
    private let alertTitleText = "РЕЗУЛЬТАТ: "
    private let alertText = "ПРАВИЛЬНЫЙ ОТВЕТ: "
    private let alertMenuText = "МЕНЮ"
    private let alertReloadText = "ПОВТОРИТЬ"
    
    
    //НАСТРОЙКИ КНОПОК
    //Размер шрифта
    private let fontSize = K.Fonts.size30
    //Цвет шрифта
    private let buttonsFontC = K.MyColorsUI.blue
    //Текущий шрифт
    private let fontCurrent = K.Fonts.mainFMedium
    //Фактор масштабирования текста
    private let minScaleF = K.Fonts.scaleFactor
    
    
//MARK: - LABELS
    @IBOutlet var numButtonsCollection: [UIButton]!
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var bestScoreLabel: UILabel!
    
    @IBOutlet weak var bestScoreText: UILabel!
    @IBOutlet weak var currentScoreText: UILabel!
    @IBOutlet weak var currentModeText: UILabel!
    

//MARK: - OBJECTS
    var play = PlayMT()
    var timer = Timer()
    let save = SaveData.singletonSaveData
    let input = InputBrain()
    

//MARK: - LOADINGS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }

    
//MARK: - UPDATE UI
    func updateUI() {
        //Присвоение стартового текста полю ответа
        answerLabel.text = startAnswerT
        //Случайное выражение
        equationLabel.text = play.randomEquation()
        //Перезапуск таймера
        timerReload()
        //Значение текущего результата
        currentScoreLabel.text = String(play.currentScore)
        //Текущий режим
        currentModeText.text = play.currentMode()
        //Лучший результат
        bestScoreLabel.text = play.bestScore()
    }
    
    
//MARK: - ACTIONS. INPUT
    //Нажатия на кнопки ввода цифр
    @IBAction func numButtonPressed(_ sender: UIButton) {
        answerLabel.text! = input.checkEnter(numToAdd: sender.accessibilityIdentifier!, currentText: answerLabel.text!)
    }
    
    //Нажатия на кнопку удаления последней цифры
    @IBAction func delButtonPressed(_ sender: UIButton) {
        answerLabel.text! = input.delLastNum(currentText: answerLabel.text!)
    }
    

//MARK: - ACTIONS. CHECK ANSWER
    @IBAction func checkPressed(_ sender: UIButton) {
        //Проверка нажатия кнопки OK при отсутствии ввода. Вводить ответ можно и когда время закончилось
        if answerLabel.text == startAnswerT {
            print("ENTER ANSWER")
            //Действия при неправильном ответе или истекшем времени
        } else if isOver || !play.checkAnswer(answer: answerLabel.text!) {
            print("TIME IS OVER OR WRONG ANSWER")
            print("Right answer is \(play.rightAnswer)")
            timer.invalidate()
            endGameAlert()
            isOver = false
        } else {
            print("RIGHT")
            //currentScore += 1
            //play.checkScore(score: currentScore)
            save.saveTotalSolved()
            updateUI()
        }
    }
    
    
//MARK: - END GAME ALERT
    func endGameAlert() {
        let alert = UIAlertController(title: "\(alertTitleText) \(play.currentScore)", message: "\(alertText) \(play.rightAnswer)", preferredStyle: .alert)
        
        let actionM = UIAlertAction(title: alertMenuText, style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            self.navigationController?.popToRootViewController(animated: true)
        }
        let actionR = UIAlertAction(title: alertReloadText, style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            self.navigationController?.reloadInputViews()
            //self.currentScore = 0
            self.play.currentScore = 0
            self.updateUI()
        }
        
        alert.addAction(actionM)
        alert.addAction(actionR)
        
        present(alert, animated: true, completion: nil)
    }

}



//MARK: - EXTENSION. НАСТРОЙКИ ОТОБРАЖЕНИЯ UI
extension PlayViewController {
    //Настройки отображения
    private func setupUI() {
        //Появление бара навигации
        navigationController?.isNavigationBarHidden = false
        //Настройки отображения для каждой кнопки
        for button in numButtonsCollection {
            //Размер текста кнопок
            button.titleLabel!.font = UIFont(name: fontCurrent, size: fontSize)
            //Цвет текста кнопок
            button.setTitleColor(buttonsFontC, for: .normal)
            //Масштабируемость кнопок
            button.titleLabel!.minimumScaleFactor = minScaleF;
            //Подгонка по ширине
            button.titleLabel!.adjustsFontSizeToFitWidth = true;
        }
    }
}

//MARK: - EXTENSION. TIMER
extension PlayViewController {
    //Запуск таймера обратного отсчета
    func countDown() {
        timerTime = play.totalTime
        secondsPast = timerTime
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    //Перезапуск таймера
    private func timerReload() {
        //Остановка
        timer.invalidate()
        //Установка прогресса на максимум
        timerProgress.setProgress(1, animated: true)
        //Запуск нового таймера
        countDown()
    }
    
    //Функция уменьшения времени
    @objc func updateTimer() {
        if secondsPast > 0 {
            secondsPast -= 1
            let progress = Float(secondsPast) / Float(timerTime)
            timerProgress.setProgress(progress, animated: true)
        } else {
            timer.invalidate()
            isOver = true
        }
    }
}
