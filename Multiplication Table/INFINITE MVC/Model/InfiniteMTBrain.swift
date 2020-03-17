//
//  InfiniteMTBrain.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct PlayMT {
//MARK: - VARIABLES
    //Максимальное число для умножения. Назначается из главного меню
    private var maxNum = Ex.numToTrain
    //TIMER. Количество времени на ответ
    let totalTime = K.PlayInf.totalTimeToAnswer
    
    //Правильный ответ
    var rightAnswer = 0
    //Текущий счет
    var currentScore = 0
    
    
//MARK: - OBJECTS
    private let save = SaveData.singletonSaveData
    
    
//MARK: - ФУНКЦИЯ ГЕНЕРАЦИИ СЛУЧАЙНОГО УРАВНЕНИЯ
    mutating func randomEquation() -> String {
        let first = Int.random(in: 1...maxNum)
        let second = Int.random(in: 1...maxNum)
        rightAnswer = first * second
        let equation = "\(first) x \(second) = ?"
        return equation
    }
    

//MARK: - ФУНКЦИЯ СРАВНЕНИЯ ОТВЕТА С ПРАВИЛЬНЫМ
    mutating func checkAnswer(answer: String) -> Bool {
        if answer == "\(rightAnswer)" {
            currentScore += 1
            checkScore(score: currentScore)
            return true
        } else {
            return false
        }
    }
    
 
//MARK: - ФУНКЦИЯ КОТОРАЯ ВОЗВРАЩАЕТ ТЕКУЩИЙ РЕЖИМ
    func currentMode() -> String {
            return "X\(Ex.numToTrain)"
    }
    
  
//MARK: - PREMIUM. ФУНКЦИЯ КОТОРАЯ ВОЗВРАЩАЕТ ЛУЧШИЙ РЕЗУЛЬТАТ
    func bestScore() -> String {
        if save.getPRO() {
            return getScoreForCurrentMode()
        } else {
            return K.Premium.freeVersionText
        }
    }
    
    
    
    
//MARK: - PRIVATE. ФУНКЦИЯ СОХРАНЕНИЯ СЧЕТА В ЗАВИСИМОСТИ ОТ РЕЖИМА
    private func checkScore(score: Int) {
        if Ex.numToTrain == 10 {
            save.saveMaxScoreX10(score: score)
        } else {
            save.saveMaxScoreX20(score: score)
        }        
    }
    
    
//MARK: - PRIVATE. ФУНКЦИЯ ВОЗВРАЩЕНИЯ ЛУЧШЕГО РЕЗУЛЬТАТА В ЗАВИСИМОСТИ ОТ РЕЖИМА
    private func getScoreForCurrentMode() -> String {
        if Ex.numToTrain == 10 {
            return String(save.getMaxScoreX10())
        } else {
            return String(save.getMaxScoreX20())
        }
    }
}


