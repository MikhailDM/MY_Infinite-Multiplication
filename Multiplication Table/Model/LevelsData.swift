//
//  LevelsData.swift
//  Multiplication Table
//
//  Created by Mike on 22.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

//В K.MAIN - ДУБЛИРУЕТСЯ. ОСТАВИТЬ ТУТ

struct LevelsData {
//MARK: - OBJECTS
    let save = SaveData.singletonSaveData
    
    
//MARK: - VARIABLES
    //Текущий уровень
    private var currentLevel: Level
    
    //Максимальное число для тренировок
    static let maxTotalSolvedEquations = 100
    
    
//MARK: - LEVELS ARRAY
    //Уровни
    let levelsArray = [
        Level(levelName: "НОВИЧОК", levelRequirement: 0),
        Level(levelName: "УЧЕНИК", levelRequirement: 2),
        Level(levelName: "СТУДЕНТ", levelRequirement: 5),
        Level(levelName: "МАТЕМАТИК", levelRequirement: 7),
        Level(levelName: "ПРОФЕССОР", levelRequirement: maxTotalSolvedEquations)
    ]
  
    
//MARK: - RETURN CURRENT LEVEL
    
    //Метод возвращающий текущий уровень в зависимости от прогресса
    mutating func getCurrentLevel() -> Level {
        //Общее число решенных примеров
        let currentSolved = save.getTotalSolved()
        //Сравнение текущего счета с требованиями уровней
        for level in levelsArray {
            if currentSolved >= level.levelRequirement {
                currentLevel = level
            } else {
                break
            }
        }
        return currentLevel
    }
}
