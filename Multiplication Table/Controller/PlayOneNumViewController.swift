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
    //Начальный тект поля ответа
    let startAnswerT = K.InputSettings.startAnswerText
    
    
//MARK: - LABELS
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
//MARK: - OBJECTS
    let input = InputBrain()
    var playOne = PlayOneNumMT()
    
    
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
            } else {
                print("ВЫ ПРОШЛИ ТРЕНИРОВКУ")
            }
        }
        
    }
    
    
// MARK: - END GAME ALERT
    
    
    
    
}
