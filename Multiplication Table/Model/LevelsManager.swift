//
//  LevelManager.swift
//  Multiplication Table
//
//  Created by Mike on 22.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct LevelsManager {
//MARK: - LEVELS ARRAY
    /*
    static let levelsArray = [
        Level(levelName: "НОВИЧОК", levelRequirement: 0),
        Level(levelName: "УЧЕНИК", levelRequirement: 2),
        Level(levelName: "СТУДЕНТ", levelRequirement: 5),
        Level(levelName: "МАТЕМАТИК", levelRequirement: 7),
        Level(levelName: "ПРОФЕССОР", levelRequirement: 10)
    ]
     */
    
    
//MARK: - OBJECTS
    private let save = SaveData.singletonSaveData
    
    
    
//MARK: - VARIABLES
    //Текущий уровень
    //private var currentLevel = levelsArray[0]
    //Массив уровней
    private let levels = K.levelsArray
    
    
    
//MARK: - RETURN CURRENT LEVEL
    
    //Метод возвращающий текущий уровень в зависимости от прогресса
    mutating func getCurrentLevel() -> LevelModel {
        //Текущий уровень
        var currentLevel = levels[0]
        //Общее число решенных примеров
        let currentSolved = save.getTotalSolved()
        //Сравнение текущего счета с требованиями уровней
        for level in levels {
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
        let max = levels.last!.levelRequirement
        return max
    }
}
