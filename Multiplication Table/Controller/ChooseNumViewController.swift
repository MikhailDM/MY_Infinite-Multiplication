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
    let fontSize: CGFloat = K.Fonts.size30
    //Текущий шрифт
    let fontCurrent = K.Fonts.maintF
    //Фактор масштабирования текста
    let minScaleF: CGFloat = K.Fonts.scaleFactor
    
    //Цвет прорешенных цифр
    let solvedNumButton = K.MyColorsUI.green
    //Цвет непрорешенных цифр
    let unSolvedNumButton = K.MyColorsUI.white
    
    //Имя перехода к тренировке 1 цифры
    let segueToPlay = K.Segues.playOneNumSegue
    
    
//MARK: - OUTLETS
    @IBOutlet var numButtonsCollection: [UIButton]!
    
    
//MARK: - OBJECTS
    let save = SaveData.singletonSaveData
    
    
//MARK: - LOADINGS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
//MARK: - UI SETUP
    
    func setupUI(){
        //Показываем Navigation Bar
        navigationController?.isNavigationBarHidden = false
        
        //Настройки для каждой кнопки
        for button in numButtonsCollection {
            //ID Кнопки в формате Int
            let id = Int(button.accessibilityIdentifier!)!
            
            //Размер текста кнопок
            button.titleLabel!.font = UIFont(name: K.Fonts.maintF, size: fontSize)
            button.titleLabel!.minimumScaleFactor = minScaleF;
            button.titleLabel!.adjustsFontSizeToFitWidth = true;
            
            //Настройка цвета кнопок. Зависит от прохождения
            button.setTitleColor(unSolvedNumButton, for: .normal)
            //Проверка на пройденный числа
            if save.getSolvedNumsState(numToCheck: id) {
                button.setTitleColor(solvedNumButton, for: .normal)
            }
        }
    }

//MARK: - ACTIONS
    
    @IBAction func chargeNumPressed(_ sender: UIButton) {
        let id = Int(sender.accessibilityIdentifier!)!
        //Назначение цифры для тренировки через обменный класс
        Ex.numToTrain = id
        print("NUM TO TRAIN: \(id)")
        //Переход к экрану игры
        self.performSegue(withIdentifier: segueToPlay, sender: sender)
    }
}
