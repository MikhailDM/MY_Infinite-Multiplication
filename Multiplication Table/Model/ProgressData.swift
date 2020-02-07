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
    
    //Текст прогресса
    let progressText = "ВАШ ТЕКУЩИЙ УРОВЕНЬ: "
    
    //УРОВНИ
    //Для Ученика
    let lvl0 = 2
    //Для Профессора
    let lvl1 = 8
    
    
//MARK: - OBJECTS
    let saved = SaveData.singletonSaveData
    
    
//MARK: - FUNCTIONS
    //Метод возвращающий прогресс игры
    func getProgress() -> Float {
        let progress = Float(saved.getMaxScore())/Float(totalProgress)
        return progress
    }
    //Метод возвращающий достигнутый уровень
    func getProgressName() -> String {
        switch saved.getMaxScore() {
        case ..<lvl0:
            return (progressText + "НОВИЧОК")
        case lvl0..<lvl1:
            return (progressText + "УЧЕНИК")
        case lvl1...:
            return (progressText + "ПРОФЕССОР")
        default:
            return ""
        }
    }
}
    
//MARK: - DATA
   
