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
    
    

//MARK: - OBJECTS
    var play = PlayMT()
    var timer = Timer()
    
    var totalTime = 10
    var secondsPast = 0
    
//MARK: - LOADINGS
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Появление бара навигации
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        //Присвоение стартового текста полю ответа
        //answerLabel.text = play.startAswerText
        //Случайное выражение
        //equationLabel.text = play.randomEquation()
        
    }

    
//MARK: - UPDATE UI
    func updateUI() {
        //Присвоение стартового текста полю ответа
        answerLabel.text = play.startAswerText
        //Случайное выражение
        equationLabel.text = play.randomEquation()
        //Перезапуск таймера
        countDown()
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
        //Проверка нажатия кнопки OK при отсутствии ввода
        //guard answerLabel.text != play.startAswerText else {print("ENTER ANSWER"); return}
        if answerLabel.text == play.startAswerText {
            print("ENTER ANSWER")
        } else if play.checkAnswer(answer: answerLabel.text!) {
            print("RIGHT")
            updateUI()
        } else {
            print("WRONG. Right answer is \(play.rightAnswer!)")
            self.performSegue(withIdentifier: "ResultsVC", sender: self)
            //updateUI()
        }
        
    }
    
    
// MARK: - TIMER
    func countDown() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
        @objc func updateTimer() {
            if secondsPast < totalTime {
                secondsPast += 1
                timerProgress.progress = Float(secondsPast) / Float(totalTime)
            } else {
                timer.invalidate()
            }
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
