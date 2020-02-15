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
    
    
    @IBOutlet weak var numbersToMult: UICollectionView!
    
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
}


    //MARK: - COLLECTION VIEW EXTENSION

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {    
    
    //Количество кнопок с числами для умножения
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return K.MainMenu.maxNumberToTrain
    }
    
    //Настройки каждой ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = numbersToMult.dequeueReusableCell(withReuseIdentifier: "numToMultiplication", for: indexPath) as! NumCollectionViewCell
        let index = indexPath.row + 1
        cell.numButton.setTitle("x\(String(index))", for: .normal)
        cell.numButton.accessibilityIdentifier = String(index)

        //Настройки отображения ячейки
        let height = numbersToMult.collectionViewLayout.collectionViewContentSize.height * 0.75
        cell.frame.size.height = height
        cell.frame.size.width = height
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.layer.cornerRadius = height / 2
        
        //cell.numButton.tag = indexPath.row
        //cell.numButton.addTarget(self, action: #selector(self.yourFunc(), for: .touchUpInside)
        
        return cell
    }
    /*
    //Функция протокола
    func collectionViewCellDelegte(didClickButtonAt index: Int) {
        print("Index")
    }*/
}
