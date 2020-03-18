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
    
    @IBOutlet weak var slider: UISlider!
    
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
        //Настройки слайдера при загрузке
        slider.value = 10
        currentNumShow()
    }
        
    
//MARK: - ACTIONS
    //Изменение уравнений в зависимости от положения слайдера
    @IBAction func sliderPressed(_ sender: UISlider) {
        currentNumShow()
    }
    
    
//MARK: - SHOW MULTIPLICATION OF CURRENT NUM
    
    func currentNumShow() {
        currentNumLabel.text = "x\(String(Int(slider.value)))"
        
        //Изменение отображения колонки с текущим числом
        for num in currentNumColumn {
            num.text! = String(Int(slider.value))
        }
        
        //Изменение отображения колонки с ответом для текущего числа
        for num in currentNumAnswerColumn {
            //num.accessibilityIdentifier
            let id = Int(num.accessibilityIdentifier!) ?? 0
            num.text! = String(Int(slider.value) * id)
        }
    }
    
    
//MARK: - END
}
