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
    private let buttonsBorderWidth = K.UI.buttonsBorderWidth
    //Цвет границ кнопок
    private let buttonsBorderColor = K.MyColorsUI.blue?.cgColor
    //Alpha для Free кнопок
    private let alphaFree = K.Premium.alphaFree
    //Фактор масштабирования текста
    private let minScaleF = K.Fonts.scaleFactor

    
//MARK: - OUTLETS
    @IBOutlet weak var quotesLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //Все кнопки
    @IBOutlet var buttonsCollection: [UIButton]!
    
    //Premium кнопки
    @IBOutlet weak var achievementsButton: UIButton!
    
    
//MARK: - OBJECTS
    private let quote = Quotes()
    private let save = SaveData.singletonSaveData
    private let levelsManager = LevelsManager()
    
    
//MARK: - LOADING
    //Вызывается единожды при загрузке конролера
    override func viewDidLoad() {
        //Прячем бар навигации
        hideNavigationBar()
    }
    
    //Действия перед тем, как обьекты добавлены в иерархию контроллера
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Прячем бар навигации
        hideNavigationBar()
        //Отображение премиум кнопок
        premiumUI()
        //Обновляем информацию по достижениям
        updateUI()
    }   
    
    //Действия после того, как обьекты добавлены в иерархию контроллера
    override func viewDidAppear(_ animated: Bool) {
        //Настраиваем отображение кнопок
        setupUI()
        //hideNavigationBar()
    }
    
//MARK: - UPDATE UI
    func updateUI() {
        //Применение случайной цитаты
        quotesLabel.text = quote.randomQuote()
        //Присвоение текущего уровня
        levelLabel.text = levelsManager.getCurrentLevelText()
        //Присвоение значения прогресс бару
        progressBar.setProgress(levelsManager.getCurrentScoreFloat(), animated: true)
        //Присвоение текущего прогресса в виде 100/100        
        scoreLabel.text = levelsManager.getCurrentScoreText()
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



//MARK: - EXTENSION. НАСТРОЙКИ ОТОБРАЖЕНИЯ UI
extension MainViewController {
    //Метод скрытия бара навигации
    private func hideNavigationBar() {
        //Скрытие бара навигации
        navigationController?.isNavigationBarHidden = true
        //Отключаем навигацию жестами
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    //Настройки отображения
    private func setupUI() {
        //Настройки кнопок начального экрана
        for button in buttonsCollection {
            //Ресайз текста кнопок
            button.titleLabel!.minimumScaleFactor = minScaleF;
            //button.titleLabel!.adjustsFontSizeToFitWidth = true;
            
            //Ширина границ
            button.layer.borderWidth = buttonsBorderWidth
            //Цвет границ
            button.layer.borderColor = buttonsBorderColor
            //Скругление границ
            button.layer.cornerRadius = button.frame.height / 2
        }
    }
    
    //Настройки отображение премиум кнопок
    private func premiumUI() {
        if !save.getPRO() {
            achievementsButton.isEnabled = false
            achievementsButton.alpha = alphaFree
        } else {
            achievementsButton.isEnabled = true
            achievementsButton.alpha = 1.0
        }
    }
}

