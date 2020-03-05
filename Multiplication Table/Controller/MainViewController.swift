//
//  MainViewController.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
//MARK: - VARIABLES
    //Толщина границ кнопок
    private let buttonsBorderWidth: CGFloat = 2
    //Цвет границ кнопок
    private let buttonsBorderColor = K.MyColorsUI.blue?.cgColor
  
    
//MARK: - OUTLETS
    @IBOutlet weak var quotesLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //Все кнопки
    @IBOutlet var buttonsCollection: [UIButton]!
   
    
//MARK: - OBJECTS
    private let quote = Quotes()
    private let save = SaveData.singletonSaveData
    private let progress = ProgressData()
    
    
//MARK: - LOADING
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        updateUI()
    }   
    
    
//MARK: - UPDATE UI
    func updateUI() {
        //Применение случайной цитаты
        quotesLabel.text = quote.randomQuote()
        //Присвоение текущего уровня
        levelLabel.text = progress.getProgressName()
        //Присвоение значения прогресс бару
        progressBar.setProgress(progress.getProgressFloat(), animated: true)
        //Присвоение текущего результата
        scoreLabel.text = progress.getProgressScore()
    }
    
        
//MARK: - UI SETUP
    
    func setupUI(){
        //Скрытие бара навигации
        navigationController?.isNavigationBarHidden = true
        
        //Настройки кнопок начального экрана
        for button in buttonsCollection {
            button.layer.borderWidth = buttonsBorderWidth
            button.layer.borderColor = buttonsBorderColor
            button.layer.cornerRadius = button.frame.height / 2
        }
        //playButton.layer.borderWidth = 2
        //playButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //playButton.layer.cornerRadius = playButton.frame.height / 2
        
        //theoryButton.layer.borderWidth = 2
        //theoryButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //theoryButton.layer.cornerRadius = theoryButton.frame.height / 2
    }


//MARK: - NAVIGATION
    
    //Переход к бесконечному умножению
    @IBAction func infiniteButtonPressed(_ sender: UIButton) {
        let id = Int(sender.accessibilityIdentifier!)!
        if id == 10 {
            print("Training 10")
        } else {
            print("Training 20")
        }
        Ex.numToTrain = id
        self.performSegue(withIdentifier: K.Segues.infinitePlaySegue, sender: sender)
    }
     //Переход к умножению по числам
    @IBAction func numChoosePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segues.chooseNumSegue, sender: sender)
    }
    
    //Переход к достижениям
    @IBAction func achieveButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segues.achieveSegue, sender: sender)
    }
    
    
    
   
}

