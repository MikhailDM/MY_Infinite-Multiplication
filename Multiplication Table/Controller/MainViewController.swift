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
    @IBOutlet weak var scoreLabel: UILabel!
    
    
//MARK: - OBJECTS
    let quote = Quotes()
    let save = SaveData.singletonSaveData
    let progress = ProgressData()
    
    
//MARK: - LOADINGS
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Скрытие бара навигации
        navigationController?.isNavigationBarHidden = true
        //Применение случайной цитаты
        quotesLabel.text = quote.randomQuote()
        
        scoreLabel.text = progress.getProgressName()
    }   
    
    //Обновление цитат при переходе на другую сцену
    override func viewDidDisappear(_ animated: Bool) {
        quotesLabel.text = quote.randomQuote()
    }
//MARK: - ACTIONS
     
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
