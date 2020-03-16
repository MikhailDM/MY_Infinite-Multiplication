//
//  PremiumViewController.swift
//  Multiplication Table
//
//  Created by Mike on 10.03.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class PremiumViewController: UIViewController {
//MARK: - OBJECTS
    private let save = SaveData.singletonSaveData
    
    
//MARK: - VARIABLES
    

//MARK: - OUTLETS
    @IBOutlet weak var premiumStateLabel: UILabel!
    
    
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
        
    }
    

//MARK: - UI UPDATE
    private func updateUI(){
        let isPro = save.getPRO()
        //Обновление состояния Premium
        if isPro {
            premiumStateLabel.text = "PREMIUM КУПЛЕН"
        } else {
            premiumStateLabel.text = "ЗАПЛАТИ БАБКИ"
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
