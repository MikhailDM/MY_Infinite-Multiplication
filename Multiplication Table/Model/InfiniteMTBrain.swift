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
    var maxNum = Ex.numToTrain
    //TIMER. Количество времени на ответ
    let totalTime = K.PlayInf.totalTimeToAnswer
    //Правильный ответ
    var rightAnswer = 0
    //текущий счет
    var currentScore = 0
    
    
//MARK: - OBJECTS
    let save = SaveData.singletonSaveData
    
    
//MARK: - ФУНКЦИЯ ГЕНЕРАЦИЯЯ СЛУЧАЙНОГО УРАВНЕНИЯ
    mutating func randomEquation() -> String {
        let first = Int.random(in: 1...maxNum)
        let second = Int.random(in: 1...maxNum)
        rightAnswer = first * second
        let equation = "\(first) x \(second) = ?"
        return equation
    }
    

//MARK: - ФУНКЦИЯ СРАВНЕНИЯ ОТВЕТА С ПРАВИЛЬНЫМ
    func checkAnswer(answer: String) -> Bool {
        if answer == "\(rightAnswer)" {
            return true
        } else {
            return false
        }
    }
    
    
// MARK: - Функция сравнения текущего счета с лучшим
    func checkScore(score: Int) {
        if Ex.numToTrain == 10 {
            if score > save.getMaxScoreX10() {
                save.saveMaxScoreX10(score: score)
            }
        } else {
            if score > save.getMaxScoreX20() {
                save.saveMaxScoreX20(score: score)
            }
        }        
    }
    
    
}


