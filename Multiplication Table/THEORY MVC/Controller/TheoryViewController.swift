//
//  TheoryViewController.swift
//  Multiplication Table
//
//  Created by Mike on 07.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class TheoryViewController: UIViewController {
//MARK: - VARIABLES
    //Размер шрифта
    private let fontSize = K.Fonts.size25
    //Текущий шрифт
    private let fontCurrent = K.Fonts.mainF
    //Цвет шрифта
    private let colorCurrent = K.MyColorsUI.white
    //Фактор масштабирования текста
    private let minScaleF = K.Fonts.scaleFactor
    
    
    
//MARK: - LABELS
    @IBOutlet weak var currentNumLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet var currentNumColumn: [UILabel]!
    
    @IBOutlet var currentNumAnswerColumn: [UILabel]!
    
    //Коллекция всех Labels
    @IBOutlet var labelsCollection: [UILabel]!
    
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
        
        //Настройки отображения для каждой кнопки
        for num in labelsCollection {
            //Размер текста
            num.textColor = colorCurrent
            //Шрифт
            num.font = UIFont(name: fontCurrent, size: fontSize)
            //Масштабирование
            num.minimumScaleFactor = minScaleF
            
            
            //Фактор масштаба
            //button.titleLabel!.minimumScaleFactor = minScaleF
            //Подгонка по ширине текста кнопки
            //button.titleLabel!.adjustsFontSizeToFitWidth = true
        }
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
