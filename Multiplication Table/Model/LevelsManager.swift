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
    private let save = SaveData.singletonSaveData
    
    
//MARK: - VARIABLES
    //Массив уровней
    private let levels = K.levelsArray
    //Текст текущего уровня
    private let currentLevelText = " ТЕКУЩИЙ УРОВЕНЬ: "
    
    //Текст для Free версии. Возвращается вместо значений
    private let freeVersionText = K.Premium.freeVersionText
    

//MARK: - PRIVATE. RETURN MAX LEVEL SCORE REQUIREMENT
    //Возвращает Int максимального возможного прогресса
    private func getMaxLevelRequirement() -> Int {
        let max = levels.last!.levelRequirement
        return max
    }
    
//MARK: - PRIVATE. RETURN CURRENT LEVEL
    //Метод возвращающий текущий уровень в зависимости от прогресса
    private func getCurrentLevel() -> LevelModel {
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
    
    

//MARK: - МЕТОДЫ ОТОБРАЖЕНИЯ ПРОГРЕССА И УРОВНЯ
//MARK: - PRO. ВСЕ РЕШЕНЫЕ ПРИМЕРЫ. ВОЗВРАЩАЕТ ПРОГРЕСС В ФОРМАТЕ - 100/100
    
    //При наборе очков больше чем максимально - возвращает в виде 100/100
    func getCurrentScoreText() -> String {
        //Текущее число решенных примеров
        let currentScore = save.getTotalSolved()
        //Необходимое/Максимальное число решенных примеров
        let maxScore = getMaxLevelRequirement()
        //Состояние Premium
        let isPro = save.getPRO()
        
        //Возвращает значения при Premium
        if isPro {
            if currentScore <= maxScore {
                let score = "\(currentScore)/\(maxScore)"
                return score
            } else {
                let score = "\(maxScore)/\(maxScore)"
                return score
            }
        //Возвращает значения при Free
        } else {
            let score = "\(freeVersionText)/\(maxScore)"
            return score
        }
    }
    
    
//MARK: - PRO. ВСЕ РЕШЕНЫЕ ПРИМЕРЫ. ВОЗВРАЩАЕТ FLOAT ОТНОСИТЕЛЬНО РЕШЕННЫХ ПРИМЕРОВ 0.0 - 1.0
    
    //При наборе очков больше чем максимально - возвращает прогресс 1.0
    func getCurrentScoreFloat() -> Float {
        //Текущее число решенных примеров
        let currentScore = save.getTotalSolved()
        //Необходимое/Максимальное число решенных примеров
        let maxScore = getMaxLevelRequirement()
        //Состояние Premium
        let isPro = save.getPRO()
        
        //Возвращает значения при Premium
        if isPro {
            if currentScore <= maxScore {
                let progress = Float(currentScore)/Float(maxScore)
                return progress
            } else {
                return 1.0
            }
        //Возвращает значения при Free
        } else {
            return 0.0
        }
    }
    
    
//MARK: - PRO. ВСЕ РЕШЕНЫЕ ПРИМЕРЫ. ВОЗВРАЩАЕТ ИМЯ ТЕКУЩЕГО УРОВНЯ
    
    //Метод возвращающий достигнутый уровень со стартовым текстом
    func getCurrentLevelText() -> String {
        //Получение текущего уровня
        let currentLevel = getCurrentLevel()
        //Состояние Premium
        let isPro = save.getPRO()
        
        //Возвращает значения при Premium
        if isPro {
            return currentLevelText + currentLevel.levelName + " "
        //Возвращает значения при Free
        } else {
            return currentLevelText + freeVersionText + " "
        }
    }
    
    
    
    
}
