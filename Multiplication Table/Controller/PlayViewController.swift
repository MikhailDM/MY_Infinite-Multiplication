//
//  PlayViewController.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
//MARK: - LABELS
    @IBOutlet var numsButtons: [UIButton]!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var bestScoreLabel: UILabel!
    

//MARK: - OBJECTS
    var play = PlayMT()
    var timer = Timer()
    let save = SaveData.singletonSaveData
 
    
//MARK: - VARIABLES
    //Переменные для таймера
    var timerTime = 0
    var secondsPast = 0
    
    //Закончилась ли игра
    var isOver = false
    
    //текущий счет
    var currentScore = 0
//MARK: - LOADINGS
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Появление бара навигации
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    
//MARK: - UPDATE UI
    func updateUI() {
        //Присвоение стартового текста полю ответа
        answerLabel.text = play.startAswerText
        //Случайное выражение
        equationLabel.text = play.randomEquation()
        //Перезапуск таймера
        timer.invalidate()
        timerProgress.setProgress(1, animated: true)
        countDown()
        //Значение лучшего результата
        bestScoreLabel.text = String(save.getMaxScoreX10())
        //Значение текущего результата
        currentScoreLabel.text = String(currentScore)
    }
    
    func updateUIAnswer() {
        //Присвоение стартового текста полю ответа
        answerLabel.text = play.startAswerText
    }
    
    
//MARK: - ACTIONS. INPUT
    //Нажатия на кнопки ввода цифр
    @IBAction func numButtonPressed(_ sender: UIButton) {
        answerLabel.text! = play.checkEnter(num: sender.accessibilityIdentifier!, length: answerLabel.text!.count, currentText: answerLabel.text!)
    }
    
    //Нажатия на кнопку удаления последней цифры
    @IBAction func delButtonPressed(_ sender: UIButton) {
        answerLabel.text! = play.delLastNum(currentText: answerLabel.text!)
    }
    

//MARK: - ACTIONS. CHECK ANSWER
    
    @IBAction func checkPressed(_ sender: UIButton) {
        //Проверка нажатия кнопки OK при отсутствии ввода. Вводить ответ можно и когда время закончилось
        if answerLabel.text == play.startAswerText {
            print("ENTER ANSWER")
            //Действия при неправильном ответе или истекшем времени
        } else if isOver || !play.checkAnswer(answer: answerLabel.text!) {
            print("TIME IS OVER OR WRONG ANSWER")
            print("Right answer is \(play.rightAnswer!)")
            timer.invalidate()
            endGameAlert()
            isOver = false
            //self.performSegue(withIdentifier: "ResultsVC", sender: self)
            //В остальных случаях это правильный ответ
        } else {
            print("RIGHT")
            currentScore += 1
            play.checkScore(score: currentScore)
            save.saveTotalSolved()
            updateUI()
        }
    }
    
    
// MARK: - TIMER 
    //Таймер обратного отсчета
    func countDown() {
        timerTime = play.totalTime
        secondsPast = timerTime
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
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
    
    
// MARK: - END GAME ALERT
    func endGameAlert() {
        let alert = UIAlertController(title: "РЕЗУЛЬТАТ: \(currentScore)", message: "ПРАВИЛЬНЫЙ ОТВЕТ: \(play.rightAnswer!)", preferredStyle: .alert)
        
        let actionM = UIAlertAction(title: "МЕНЮ", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            self.navigationController?.popToRootViewController(animated: true)
        }
        let actionR = UIAlertAction(title: "ПОВТОРИТЬ", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            self.navigationController?.reloadInputViews()
            self.currentScore = 0
            self.updateUI()
        }
        
        alert.addAction(actionM)
        alert.addAction(actionR)
        
        present(alert, animated: true, completion: nil)
    }
    
    
// MARK: - Navigation

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
