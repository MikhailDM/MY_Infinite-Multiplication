//
//  InfiniteMTBrain.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct PlayMT {
    //MARK: - Переменные и константы
    //Максимальное число для умножения. Назначается из главного меню
    var maxNum = Ex.numToTrain
    
    //Правильный ответ
    var rightAnswer: Int?
    
    //Максимальная длина поля ответа
    let maxAnswerLength = 6
    
    //STARTING TEXT. Answer Text
    let startAswerText = "ВВЕДИТЕ ОТВЕТ"
    
    //TIMER. Количество времени на ответ
    let totalTime = 10
    
    
//MARK: - OBJECTS
    let save = SaveData.singletonSaveData
    
    
//MARK: - Функция проверки ввода чисел в поле ответа
    func checkEnter(num: String, length: Int, currentText: String) -> String {
        if currentText == startAswerText {
            return num
        } else if length >= maxAnswerLength {
            return currentText
        } else {
            return (currentText + num)
        }
    }
    
    
//MARK: - Функция удаление последнего символа поля ответа
    func delLastNum(currentText: String) -> String {
        if currentText == startAswerText {
            return startAswerText
        } else if currentText.count <= 1 {
            return startAswerText
        } else {
            return (String(currentText.dropLast()))
        }
    }
    
    
//MARK: - Функция генерации случайного уравнения
    mutating func randomEquation() -> String {
        let first = Int.random(in: 1...maxNum)
        let second = Int.random(in: 1...maxNum)
        rightAnswer = first * second
        let equation = "\(first) x \(second) = ?"
        return equation
    }
    

    //MARK: - Функция проверки ответа

    func checkAnswer(answer: String) -> Bool {
        if answer == "\(rightAnswer!)" {
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


