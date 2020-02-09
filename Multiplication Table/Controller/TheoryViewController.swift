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
    
    @IBOutlet weak var currentNumLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet var currentNumColumn: [UILabel]!
    @IBOutlet var currentNumAnswerColumn: [UILabel]!
    
    
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
        stepper.value = 1
        currentNumShow()
    }
        
    
//MARK: - ACTIONS
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        currentNumShow()
    }
    
    
//MARK: - SHOW MULTIPLICATION OF CURRENT NUM
    
    func currentNumShow() {
        currentNumLabel.text = "x\(String(Int(stepper.value)))"
        
        //Изменение отображения колонки с текущим числом
        for num in currentNumColumn {
            num.text! = String(Int(stepper.value))
        }
        
        //Изменение отображения колонки с ответом для текущего числа
        for num in currentNumAnswerColumn {
            //num.accessibilityIdentifier
            let id = Int(num.accessibilityIdentifier!) ?? 0
            num.text! = String(Int(stepper.value) * id)
               
        /*for i in 1...currentNumAnswerColumn.count {
            currentNumAnswerColumn[i-1].text = String(Int(stepper.value) * currentNumAnswerColumn.)
            //currentNumAnswerColumn[i-1].text = String(Int(stepper.value) * i)
            //num.text = String(Int(stepper.value) * )*/
        }
    }
}
