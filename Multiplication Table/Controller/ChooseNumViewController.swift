//
//  ChooseNumViewController.swift
//  Multiplication Table
//
//  Created by Mike on 20.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class ChooseNumViewController: UIViewController {
//MARK: - VARIABLES
    //Размер шрифта
    private let fontSize: CGFloat = K.Fonts.size30
    //Текущий шрифт
    private let fontCurrent = K.Fonts.mainF
    //Фактор масштабирования текста
    private let minScaleF: CGFloat = K.Fonts.scaleFactor
    
    //Цвет прорешенных цифр и границ кнопок
    private let solvedNumButtonColor = K.MyColorsUI.green
    //Цвет непрорешенных цифр
    private let unSolvedNumButtonColor = K.MyColorsUI.white
    
    //Толщина границ кнопок
    private let buttonsBorderWidth: CGFloat = 2
    
    
//MARK: - OUTLETS
    @IBOutlet var numButtonsCollection: [UIButton]!
    
    
//MARK: - OBJECTS
    let save = SaveData.singletonSaveData
    
    
//MARK: - LOADINGS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        premiumUI()
    }
    
    
//MARK: - SETUP UI
    func setupUI(){
        //Показываем Navigation Bar
        navigationController?.isNavigationBarHidden = false
        
        //Настройки отображения для каждой кнопки
        for button in numButtonsCollection {
            //Размер текста кнопок
            button.titleLabel!.font = UIFont(name: K.Fonts.mainF, size: fontSize)
            button.titleLabel!.minimumScaleFactor = minScaleF;
            button.titleLabel!.adjustsFontSizeToFitWidth = true;
            
            //Рамки кнопок
            button.layer.borderWidth = buttonsBorderWidth
            button.layer.cornerRadius = button.frame.height / 3
            button.layer.borderColor = solvedNumButtonColor?.cgColor
        }
    }

    
    //MARK: - PREMIUM UI. КНОПКИ ПРОЙДЕННЫХ ЧИСЕЛ НЕ ПОДСВЕЧИВАЮТСЯ В FREE ВЕРСИИ
    func premiumUI() {
        for button in numButtonsCollection {
            //ID Кнопки в формате Int
            let id = Int(button.accessibilityIdentifier!)!
            
            //Проверка на пройденный числа и наличие Premium
            if save.getPRO() && save.getSolvedNumsState(numToCheck: id) {
                button.setTitleColor(solvedNumButtonColor, for: .normal)
                //button.layer.borderColor = solvedNumButtonColor?.cgColor
            } else {
                button.setTitleColor(unSolvedNumButtonColor, for: .normal)
                //button.layer.borderColor = unSolvedNumButtonColor?.cgColor
            }
        }
    }
    
    
//MARK: - NAVIGATION
    //Переход к тренировке и назначение числа для нее
    @IBAction func chargeNumPressed(_ sender: UIButton) {
        //ID Кнопки в формате Int
        let id = Int(sender.accessibilityIdentifier!)!
        //Назначение цифры для тренировки через обменный класс
        Ex.numToTrain = id
        print("NUM TO TRAIN: \(id)")
        //Переход к экрану игры
        self.performSegue(withIdentifier: K.Segues.playOneNumSegue, sender: sender)
    }
}
