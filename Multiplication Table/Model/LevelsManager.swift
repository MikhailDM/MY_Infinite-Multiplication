//
//  LevelManager.swift
//  Multiplication Table
//
//  Created by Mike on 22.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct LevelsManager {
    
//MARK: - OBJECTS
    let save = SaveData.singletonSaveData
    let levels = LevelsData()
    
//MARK: - VARIABLES
    //Текущий уровень
    private var currentLevel: Level
    
    
//MARK: - RETURN CURRENT LEVEL
    
    //Метод возвращающий текущий уровень в зависимости от прогресса
    mutating func getCurrentLevel() -> Level {
        //Общее число решенных примеров
        let currentSolved = save.getTotalSolved()
        //Сравнение текущего счета с требованиями уровней
        for level in levels.levelsArray {
            if currentSolved >= level.levelRequirement {
                currentLevel = level
            } else {
                break
            }
        }
        return currentLevel
    }
    
       
//MARK: - RETURN MAX LEVEL SCORE REQUIREMENT
    
    //Возвращает Int максимального возможного прогресса
    func getMaxLevelRequirement() -> Int {
        let max = levels.levelsArray.last!.levelRequirement
        return max
    }
}
