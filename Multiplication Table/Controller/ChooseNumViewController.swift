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
    let fontSize: CGFloat = 30
    //Фактор масштабирования текста
    let minScaleF: CGFloat = 0.5
    
    //Цвет прорешенных цифр
    let solvedNumButton = K.MyColors.green
    //Цвет непрорешенных цифр
    let unSolvedNumButton = K.MyColors.white
    
    
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
        Ex.numToTrain = id
        print("Num to train: \(id)")
        self.performSegue(withIdentifier: K.Segues.playOneNumSegue, sender: sender)
        
    }  

}
