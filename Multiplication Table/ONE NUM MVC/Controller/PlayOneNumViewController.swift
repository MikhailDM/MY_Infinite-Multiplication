//
//  PlayOneNumViewController.swift
//  Multiplication Table
//
//  Created by Mike on 20.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class PlayOneNumViewController: UIViewController {
//MARK: - VARIABLES
    //Начальный текст поля ответа
    private let startAnswerT = K.InputSettings.startAnswerText
    //Максимальное число правильных ответов
    private let maxRightAnswers = K.PlayOne.maxRightAnswers
    //Максимальное число неправильных ответов
    private let maxWrongAnswers = K.PlayOne.maxWrongAnswers

    
    //НАСТРОЙКИ UIALERTCONTROLLER
    //Фон UIAlertController
    private let alertBackC = K.MyColorsUI.white
    //Цвет текста кнопок UIAlertController
    private let alertFontC = K.MyColorsUI.green
    //Тексты
    private let alertTitleTextWin = "ТРЕНИРОВКА ПРОЙДЕНА"
    private let alertTitleTextLose = "ОШИБКИ - ПУТЬ К УСПЕХУ"
    private let alertWinText = "ОТЛИЧНЫЙ РЕЗУЛЬТАТ"
    private let alertLoseText = "ПОПРОБУЙТЕ ЕЩË"
    private let alertMenuText = "МЕНЮ"
    private let alertReloadText = "ПОВТОРИТЬ"
    
    
    //НАСТРОЙКИ КНОПОК
    //Размер шрифта
    private let fontSize = K.Fonts.size30
    //Цвет шрифта
    private let buttonsFontC = K.MyColorsUI.green
    //Текущий шрифт
    private let fontCurrent = K.Fonts.mainFMedium
    //Фактор масштабирования текста
    private let minScaleF = K.Fonts.scaleFactor
    
    
//MARK: - OUTLETS
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    //Коллекция кнопок
    @IBOutlet var numButtonsCollection: [UIButton]!
    
//MARK: - OBJECTS
    let input = InputBrain()
    var playOne = PlayOneNumMT()
    let save = SaveData.singletonSaveData
    
//MARK: - LOADINGS
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupUI()
    }
    
    
//MARK: - UPDATE UI
    func updateUI() {
        //Присвоение стартового текста полю ответа
        answerLabel.text = startAnswerT
        //Случайное выражение
        equationLabel.text = playOne.randomEquation()
        //Начальный счет
        scoreLabel.text! = "+\(playOne.countRightAnswers)/\(playOne.countWrongAnswers)"
    }
    
    
//MARK: - SETUP UI
    func setupUI(){
        //Настройки отображения для каждой кнопки
        for button in numButtonsCollection {
            //Размер текста кнопок
            button.titleLabel!.font = UIFont(name: fontCurrent, size: fontSize)
            button.setTitleColor(buttonsFontC, for: .normal)
            button.titleLabel!.minimumScaleFactor = minScaleF;
            button.titleLabel!.adjustsFontSizeToFitWidth = true;
        }
    }
    
//MARK: - ACTIONS. INPUT
    //Нажатия на кнопки ввода цифр
    @IBAction func numButtonPressed(_ sender: UIButton) {
        answerLabel.text! = input.checkEnter(numToAdd: sender.accessibilityIdentifier!, currentText: answerLabel.text!)
    }
    
    //Нажатия на кнопку удаления последней цифры
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        answerLabel.text! = input.delLastNum(currentText: answerLabel.text!)
    }
    
//MARK: - ACTIONS. CHECK ANSWER
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        //Проверка на правильность ответа
        if answerLabel.text == startAnswerT {
        print("ENTER ANSWER")
        } else if playOne.checkAnswer(answer: answerLabel.text!) {
            print("RIGHT")
            updateUI()
        } else {
            print("WRONG")
            updateUI()
        }
        
        //Проверка на конец игры
        if playOne.checkEndGame() {
            print("Game is Over")
            if playOne.countWrongAnswers <= -maxWrongAnswers {
                print("СЛИШКОМ МНОГО ОШИБОК")
                endGameAlert(isPassTrain: false)
            } else {
                print("ВЫ ПРОШЛИ ТРЕНИРОВКУ")
                endGameAlert(isPassTrain: true)
                //Сохраняем число как пройденное
                save.saveSolvedNumsMap(numToSave: playOne.firstNum)                
            }
        }
    }
    
    
//MARK: - END GAME ALERT
    func endGameAlert(isPassTrain: Bool) {
        //Исходный текст правильного ответа
        var titleText = alertTitleTextWin
        var message = alertWinText
        //Текст при ошибках
        if !isPassTrain {
            titleText = alertTitleTextLose
            message = alertLoseText
        }
        
        let alert = UIAlertController(title: titleText, message: message, preferredStyle: .alert)
        
        let actionM = UIAlertAction(title: alertMenuText, style: .default) { (action) in
            //Переход в корневой контроллер
            self.navigationController?.popToRootViewController(animated: true)
        }
        let actionR = UIAlertAction(title: alertReloadText, style: .default) { (action) in
            //Повтор тренировки
            self.navigationController?.reloadInputViews()
            self.playOne.countRightAnswers = self.maxRightAnswers
            self.playOne.countWrongAnswers = 0
            self.updateUI()
        }
        
        //Цвет фона
        //alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = alertBackC
        //Цвет текста кнопок
        alert.view.tintColor = alertFontC
        
        alert.addAction(actionM)
        alert.addAction(actionR)
        present(alert, animated: true, completion: nil)
    }
    
}





