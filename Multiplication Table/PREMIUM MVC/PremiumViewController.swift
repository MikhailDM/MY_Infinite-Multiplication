//
//  PremiumViewController.swift
//  Multiplication Table
//
//  Created by Mike on 10.03.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class PremiumViewController: UIViewController {
//MARK: - VARIABLES
    let proText = """
    Доступ к достижениям

    Возможность отслеживать свой прогресс

    Результаты пройденных тренировок

    Лучшие результаты в бесконечных режимах

    Новые фишки следующих версий
    
    Поддержка развития проекта
    """
    
//MARK: - OBJECTS
    private let save = SaveData.singletonSaveData
    

//MARK: - OUTLETS
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
//MARK: - LOADING
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
   
    
    
//MARK: - UI SETUP
    private func setupUI(){
        
        //Показ бара навигации
        navigationController?.isNavigationBarHidden = false
        //Фактор масштаба
        purchaseButton.titleLabel!.minimumScaleFactor = K.Fonts.scaleFactor
        //Подгонка по ширине текста кнопки
        //purchaseButton.titleLabel!.adjustsFontSizeToFitWidth = true
        
        //Текст описания премиум
        descriptionLabel.text = proText
        
        //Ширина границ
        purchaseButton.layer.borderWidth = K.UI.buttonsBorderWidth
        //Цвет границ
        purchaseButton.layer.borderColor = K.MyColorsUI.green?.cgColor
        //Скругление границ
        purchaseButton.layer.cornerRadius = purchaseButton.frame.height / 4
        
        
    }
    
    
//MARK: - UI UPDATE. РЕАЛИЗОВАТЬ БЛОКИРОВКУ КНОПКИ ПОСЛЕ ПОКУПКИ
    private func updateUI(){
        let isPro = save.getPRO()
        //Обновление состояния Premium
        if isPro {
            purchaseButton.setTitle("PREMIUM", for: .normal)
            //Цвет границ
            purchaseButton.layer.borderColor = K.MyColorsUI.green?.cgColor
        } else {
            purchaseButton.setTitle("BUY PREMIUM", for: .normal)
            //Цвет границ
            purchaseButton.layer.borderColor = K.MyColorsUI.blue?.cgColor
        }
        
    }
    
//MARK: - ACTION. SETUP PREMIUM. ИЗМЕНИТЬ НА РЕАЛЬНУЮ ПОКУПКУ
    
    @IBAction func premiumButtonPressed(_ sender: UIButton) {
        let isPro = save.getPRO()
        //В данных действиях просто устанавливаем противоположные значения
        if isPro {
            save.savePRO(isPRO: false)
            print("PRO ОТМЕНЕНО")
            updateUI()
        } else {
            save.savePRO(isPRO: true)
            print("PRO КУПЛЕНО")
            updateUI()
        }
    }
    
   
}


