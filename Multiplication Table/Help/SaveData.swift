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
    
//MARK: - PRO ВЕРСИЯ
    
    private let proVersion = "ProVersion"
    //Метод сохранения
    func savePRO(total: Bool) {
        defaults.set(total, forKey: proVersion)
    }
    //Метод получения
    func getPRO() -> Bool {
        let isPRO = defaults.bool(forKey: proVersion)
        return isPRO
    }

//MARK: - ОБЩЕЕ ЧИСЛО ПРАВИЛЬНО РЕШЕННЫХ ПРИМЕРОВ
    
    private let totalSolved = "TotalEquationsSolved"
    //Метод сохранения. При вызове поднимаем на единичку и сохраняем
    func saveTotalSolved() {
        let total = getTotalSolved() + 1
        defaults.set(total, forKey: totalSolved)
    }
    //Метод получения
    func getTotalSolved() -> Int {
        let total = defaults.integer(forKey: totalSolved)
        return total
    }

//MARK: - БЕСКОНЕЧНАЯ ТАБЛИЦА УМНОЖЕНИЯ x10. ЛУЧШИЙ РЕЗУЛЬТАТ
    
    //Методы MaxScore x10
    private let maxScoreNameX10 = "MaxScoreX10"
    func saveMaxScoreX10(score: Int) {
        defaults.set(score, forKey: maxScoreNameX10)
    }
    func getMaxScoreX10() -> Int {
        let maxScore = defaults.integer(forKey: maxScoreNameX10)
        return maxScore
    }     

//MARK: - БЕСКОНЕЧНАЯ ТАБЛИЦА УМНОЖЕНИЯ x20. ЛУЧШИЙ РЕЗУЛЬТАТ

    //Методы MaxScore x20
    private let maxScoreNameX20 = "MaxScoreX20"
    func saveMaxScoreX20(score: Int) {
        defaults.set(score, forKey: maxScoreNameX20)
    }
    func getMaxScoreX20() -> Int {
        let maxScore = defaults.integer(forKey: maxScoreNameX20)
        return maxScore
    }
}
