//
//  MainViewController.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
//MARK: - OUTLETS
    @IBOutlet weak var quotesLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var theoryButton: UIButton!
    
    
    @IBOutlet weak var numbersToMult: UICollectionView!
    
//MARK: - OBJECTS
    let quote = Quotes()
    let save = SaveData.singletonSaveData
    let progress = ProgressData()
    
    
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
        playButton.layer.borderWidth = 2
        playButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        playButton.layer.cornerRadius = playButton.frame.height / 2
        
        theoryButton.layer.borderWidth = 2
        theoryButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        theoryButton.layer.cornerRadius = theoryButton.frame.height / 2
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
    
    
   
}

