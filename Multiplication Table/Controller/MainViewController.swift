//
//  MainViewController.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
//MARK: - OBJECTS
    private let quote = Quotes()
    private let save = SaveData.singletonSaveData
    private let levelsManager = LevelsManager()
        
    
//MARK: - VARIABLES
    //Толщина границ кнопок
    private let buttonsBorderWidth: CGFloat = 2
    //Цвет границ кнопок
    private let buttonsBorderColor = K.MyColorsUI.blue?.cgColor
    
    //Alpha для Free кнопок
    private let alphaFree = K.Premium.alphaFree
  
    
//MARK: - OUTLETS
    @IBOutlet weak var quotesLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //Все кнопки
    @IBOutlet var buttonsCollection: [UIButton]!
    
    //Premium кнопки
    @IBOutlet weak var achievementsButton: UIButton!
    
    
    
//MARK: - LOADING
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        updateUI()
        premiumUI()
    }   
    
    
//MARK: - UPDATE UI
    func updateUI() {
        //Применение случайной цитаты
        quotesLabel.text = quote.randomQuote()
        //Присвоение текущего уровня
        //levelLabel.text = progress.getProgressName()
        levelLabel.text = levelsManager.getCurrentLevelText()
        //Присвоение значения прогресс бару
        progressBar.setProgress(levelsManager.getCurrentScoreFloat(), animated: true)
        //Присвоение текущего прогресса в виде 100/100        
        scoreLabel.text = levelsManager.getCurrentScoreText()
    }
    
        
//MARK: - SETUP UI
    func setupUI() {
        //Скрытие бара навигации
        navigationController?.isNavigationBarHidden = true
        
        //Настройки кнопок начального экрана
        for button in buttonsCollection {
            button.layer.borderWidth = buttonsBorderWidth
            button.layer.borderColor = buttonsBorderColor
            button.layer.cornerRadius = button.frame.height / 2
        }
        /*
        //Кнопка достижений - НЕДОСТУПНА в Free версии
        if !save.getPRO() {
            achievementsButton.isEnabled = false
            achievementsButton.titleLabel?.alpha = 0.1
        } else {
            achievementsButton.isEnabled = true
            achievementsButton.titleLabel?.alpha = 1.0
        }*/
    }
    
    
//MARK: - PREMIUM UI. КНОПКА ДОСТИЖЕНИЙ НЕ ДОСТУПНА В FREE ВЕРСИИ
    func premiumUI() {
        if !save.getPRO() {
            achievementsButton.isEnabled = false
            achievementsButton.alpha = alphaFree
        } else {
            achievementsButton.isEnabled = true
            achievementsButton.alpha = 1.0
        }
    }
    

//MARK: - NAVIGATION    
    //Переход к бесконечному умножению
    @IBAction func infiniteButtonPressed(_ sender: UIButton) {
        let id = Int(sender.accessibilityIdentifier!)!
        print("Training \(id)")
        Ex.numToTrain = id
        self.performSegue(withIdentifier: K.Segues.infinitePlaySegue, sender: sender)
    }
     //Переход к умножению по числам
    @IBAction func numChoosePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segues.chooseNumSegue, sender: sender)
    }
    
    //Переход к теории
    @IBAction func theoryButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segues.theorySegue, sender: sender)
    }
    
    //Переход к достижениям
    @IBAction func achieveButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segues.achieveSegue, sender: sender)
    }
    
    //Переход к Premium
    @IBAction func premiumButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segues.premiumSegue, sender: sender)
    }
    
}

