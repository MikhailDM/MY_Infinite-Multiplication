//
//  MainViewController.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
//MARK: - LABELS
    @IBOutlet weak var quotesLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var theoryButton: UIButton!
    
//MARK: - OBJECTS
    let quote = Quotes()
    let save = SaveData.singletonSaveData
    let progress = ProgressData()
    
    
//MARK: - VARIABLES
    //BUTTONS
    
    
//MARK: - LOADING
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        updateUI()
    }   
    
    
//MARK: - UPDATE UI
    func updateUI() {
        //Скрытие бара навигации
        navigationController?.isNavigationBarHidden = true
        
        //Применение случайной цитаты
        quotesLabel.text = quote.randomQuote()
        
        //Присвоение текущего уровня
        levelLabel.text = progress.getProgressName()
        //Присвоение значения прогресс бару
        progressBar.setProgress(progress.getProgress(), animated: true)
        
        //Присвоение текущего результата
        scoreLabel.text = progress.getProgressScore()
    }

    
        
    //MARK: - UI SETTINGS
    
    func setupUI(){
       //Настройки кнопок начального экрана
        playButton.layer.borderWidth = 2
        playButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        playButton.layer.cornerRadius = playButton.frame.height / 2
        
        theoryButton.layer.borderWidth = 2
        theoryButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        theoryButton.layer.cornerRadius = theoryButton.frame.height / 2
    }
}
