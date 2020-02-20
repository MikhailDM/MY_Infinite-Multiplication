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
    
    
//MARK: - OUTLETS
    @IBOutlet var numButtonsCollection: [UIButton]!
    
    
    
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
            //Размер текста кнопок
            button.titleLabel!.font = UIFont(name: K.Fonts.maintF, size: fontSize)
            button.titleLabel!.minimumScaleFactor = minScaleF;
            button.titleLabel!.adjustsFontSizeToFitWidth = true;
        }
    }

//MARK: - ACTIONS
    
    @IBAction func chargeNumPressed(_ sender: UIButton) {
        let id = Int(sender.accessibilityIdentifier!)!
        Ex.numToTrain = id
        print("Num to train: \(id)")
        
    }  

}
