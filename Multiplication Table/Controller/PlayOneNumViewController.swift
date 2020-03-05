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
    let startAnswerT = K.InputSettings.startAnswerText
    
    //Фон UIAlertController
    let alertBackC = K.MyColorsUI.white
    //Цвет текста кнопок UIAlertController
    let alertFontC = K.MyColorsUI.green
    
    
//MARK: - LABELS
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
//MARK: - OBJECTS
    let input = InputBrain()
    var playOne = PlayOneNumMT()
    let save = SaveData.singletonSaveData
    
//MARK: - LOADINGS
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
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
            if playOne.countWrongAnswers <= -K.PlayOne.maxWrongAnswers {
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
    
    
// MARK: - END GAME ALERT
    func endGameAlert(isPassTrain: Bool) {
        //Исходный текст правильного ответа
        var titleText = "ВЫ УСПЕШНО ЗАКОНЧИЛИ ТРЕНИРОВКУ"
        var message = "ВЫ МОЛОДЕЦ"
        
        if !isPassTrain {
            titleText = "ПОПРОБУЙТЕ ЕЩЕ РАЗ"
            message = "ОТРАБОТКА ОШИБОК ДЕЛАЕТ ВАС СИЛЬНЕЕ"
        }
        
        let alert = UIAlertController(title: titleText, message: message, preferredStyle: .alert)
        
        let actionM = UIAlertAction(title: "МЕНЮ", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            self.navigationController?.popToRootViewController(animated: true)
        }
        let actionR = UIAlertAction(title: "ПОВТОРИТЬ", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            self.navigationController?.reloadInputViews()
            //self.currentScore = 0
            self.playOne.countRightAnswers = K.PlayOne.maxRightAnswers
            self.playOne.countWrongAnswers = 0
            self.updateUI()
        }
        
        //Цвет фона
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = alertBackC
        //Цвет текста кнопок
        alert.view.tintColor = alertFontC
        //alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor : UIColor.white]), forKey: "attributedTitle")
        //alert.view.col
        //alert.view.subviews.first?.subviews.first?.subviews.first?.tintColor = alertFontC
        

        //alert.view.tintColor = UIColor.white
        //alert.view.backgroundColor = .black
        //alert.view.alpha = 0.1
        
        alert.addAction(actionM)
        alert.addAction(actionR)
        
        present(alert, animated: true, completion: nil)
    }
    
}

