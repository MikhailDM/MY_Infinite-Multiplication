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
    
    
//MARK: - LABELS
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
//MARK: - OBJECTS
    let input = InputBrain()
    
    
//MARK: - LOADINGS
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//MARK: - UPDATE UI

    
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
    
    
// MARK: - END GAME ALERT
    
    
    
    
}
