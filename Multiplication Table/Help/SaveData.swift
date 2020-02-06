//
//  SaveData.swift
//  Multiplication Table
//
//  Created by Mike on 06.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

class SaveData {
    let defaults = UserDefaults.standard
    static let singletonSaveData = SaveData()
    
//MARK: - БЕСКОНЕЧНАЯ ТАБЛИЦА УМНОЖЕНИЯ
    
    //Методы MaxScore
    private let maxScoreName = "MaxScore"
    func saveMaxScore(score: Int) {
        defaults.set(score, forKey: maxScoreName)
    }
    func getMaxScore() -> Int {
        let maxScore = defaults.integer(forKey: maxScoreName)
        return maxScore
    }     
}
