//
//  ProgressData.swift
//  Multiplication Table
//
//  Created by Mike on 07.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct ProgressData {
//MARK: - OBJECTS
    private let saved = SaveData.singletonSaveData
    private let levelsManager = LevelsManager()
    
    
//MARK: - VARIABLES
    //Максимальный прогресс в игре
    private let totalP = K.MainMenu.maxTotalSolvedEquations
    //private let totalP = levelsManager.getMaxLevelRequirement()
    //Текст прогресса
    let progressT = K.MainMenu.progressText
    //Словарь уровней
    let levelsName = K.MainMenu.levels
    let levelsNum = K.MainMenu.levelsCharge
    
    
//MARK: - ВСЕ РЕШЕНЫЕ ПРИМЕРЫ. ВОЗВРАЩАЕТ FLOAT ОТНОСИТЕЛЬНО РЕШЕННЫХ ПРИМЕРОВ 0.0 - 1.0
    
    //При наборе очков больше чем максимально - возвращает прогресс 1.0
    func getProgressFloat() -> Float {
        if saved.getTotalSolved() <= totalP {
            let progress = Float(saved.getTotalSolved())/Float(totalP)
            return progress
        } else {
            return 1.0
        }
    }
    

//MARK: - ВСЕ РЕШЕНЫЕ ПРИМЕРЫ. ВОЗВРАЩАЕТ ПРОГРЕСС В ФОРМАТЕ - 10/10
  
    //При наборе очков больше чем максимально - возвращает 10/10
    func getProgressScore() -> String {
        if saved.getTotalSolved() <= totalP {
            let score = "\(saved.getTotalSolved())/\(totalP)"
            return score
        } else {
            let score = "\(totalP)/\(totalP)"
            return score
        }
    }

    
//MARK: - ВСЕ РЕШЕНЫЕ ПРИМЕРЫ. ВОЗВРАЩАЕТ ИМЯ ТЕКУЩЕГО УРОВНЯ
    
    //Метод возвращающий достигнутый уровень
    func getProgressName() -> String {
        switch saved.getTotalSolved() {
        case ..<levelsNum[0]:
            return (progressT + levelsName[0])
        case ..<levelsNum[1]:
            return (progressT + levelsName[1])
        case ..<levelsNum[2]:
            return (progressT + levelsName[2])
        case ..<levelsNum[3]:
            return (progressT + levelsName[3])
        case levelsNum[3]...:
            return (progressT + levelsName[4])
        default:
            return progressT + levelsName[0]
        }
    }
}
   
