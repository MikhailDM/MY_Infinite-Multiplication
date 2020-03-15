//
//  TheoryViewController.swift
//  Multiplication Table
//
//  Created by Mike on 07.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class TheoryViewController: UIViewController {
//MARK: - LABELS
    @IBOutlet weak var currentNumLabelX10: UILabel!
    @IBOutlet weak var currentNumLabelX20: UILabel!
    
    @IBOutlet weak var stepperX10: UIStepper!
    @IBOutlet weak var stepperX20: UIStepper!
    
    @IBOutlet var currentNumColumnX10: [UILabel]!
    @IBOutlet var currentNumColumnX20: [UILabel]!
    
    @IBOutlet var currentNumAnswerColumnX10: [UILabel]!
    @IBOutlet var currentNumAnswerColumnX20: [UILabel]!
    
    
//MARK: - LOADING
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
//MARK: - UI SETTINGS
    func setupUI(){
        //Показываем Navigation Bar
        navigationController?.isNavigationBarHidden = false
        //Настройки степера при загрузке
        stepperX10.value = 1
        stepperX20.value = 10
        currentNumShowX10()
        currentNumShowX20()
    }
        
    
//MARK: - ACTIONS
    
    @IBAction func stepperX10Pressed(_ sender: UIStepper) {
        currentNumShowX10()
    }
    
    @IBAction func stepperX20Pressed(_ sender: UIStepper) {
        currentNumShowX20()
    }
    
    
    
//MARK: - SHOW MULTIPLICATION OF CURRENT NUM X10
    
    func currentNumShowX10() {
        currentNumLabelX10.text = "x\(String(Int(stepperX10.value)))"
        
        //Изменение отображения колонки с текущим числом
        for num in currentNumColumnX10 {
            num.text! = String(Int(stepperX10.value))
        }
        
        //Изменение отображения колонки с ответом для текущего числа
        for num in currentNumAnswerColumnX10 {
            //num.accessibilityIdentifier
            let id = Int(num.accessibilityIdentifier!) ?? 0
            num.text! = String(Int(stepperX10.value) * id)
               
        /*for i in 1...currentNumAnswerColumn.count {
            currentNumAnswerColumn[i-1].text = String(Int(stepper.value) * currentNumAnswerColumn.)
            //currentNumAnswerColumn[i-1].text = String(Int(stepper.value) * i)
            //num.text = String(Int(stepper.value) * )*/
        }
    }
    
//MARK: - SHOW MULTIPLICATION OF CURRENT NUM X10
    
    func currentNumShowX20() {
        currentNumLabelX20.text = "x\(String(Int(stepperX20.value)))"
        
        //Изменение отображения колонки с текущим числом
        for num in currentNumColumnX20 {
            num.text! = String(Int(stepperX20.value))
        }
        
        //Изменение отображения колонки с ответом для текущего числа
        for num in currentNumAnswerColumnX20 {
            //num.accessibilityIdentifier
            let id = Int(num.accessibilityIdentifier!) ?? 0
            num.text! = String(Int(stepperX20.value) * id)
               
        /*for i in 1...currentNumAnswerColumn.count {
            currentNumAnswerColumn[i-1].text = String(Int(stepper.value) * currentNumAnswerColumn.)
            //currentNumAnswerColumn[i-1].text = String(Int(stepper.value) * i)
            //num.text = String(Int(stepper.value) * )*/
        }
    }
    
    
//MARK: - END
}
