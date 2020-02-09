//
//  ProgressData.swift
//  Multiplication Table
//
//  Created by Mike on 07.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct ProgressData {
//MARK: - VARIABLES
    //Максимальный прогресс в игре
    let totalProgress = 100
    
    //УРОВНИ
    //Для Ученика
    let lvl0 = 20
    //Для Профессора
    let lvl1 = 70
    
    //Текст прогресса
    let progressText = "ТЕКУЩИЙ УРОВЕНЬ: "
    
//MARK: - OBJECTS
    let saved = SaveData.singletonSaveData
    
    
//MARK: - FUNCTIONS
    //Метод возвращающий прогресс игры
    //При наборе очков больше чем максимально - возвращает прогресс 1.0
    func getProgress() -> Float {
        if saved.getMaxScore() <= totalProgress {
            let progress = Float(saved.getMaxScore())/Float(totalProgress)
            return progress
        } else {
            return 1.0
        }
    }
    
    //Метод возвращающий количество очков
    //При наборе очков больше чем максимально - возвращает 10/10
    func getProgressScore() -> String {
        if saved.getMaxScore() <= totalProgress {
            let score = "\(saved.getMaxScore())/\(totalProgress)"
            return score
        } else {
            let score = "\(totalProgress)/\(totalProgress)"
            return score
        }
    }
    
    //Метод возвращающий достигнутый уровень
    func getProgressName() -> String {
        switch saved.getMaxScore() {
        case ..<lvl0:
            return (progressText + "НОВИЧОК")
        case lvl0..<lvl1:
            return (progressText + "УЧЕНИК")
        case lvl1..<totalProgress:
            return (progressText + "ПРОФЕССОР")
        case totalProgress...:
            return (progressText + "МАТЕМАТИК")
        default:
            return ""
        }
    }
}
    
//MARK: - DATA
   
