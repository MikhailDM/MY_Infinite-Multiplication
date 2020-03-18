//
//  OneNumMTBrain.swift
//  Multiplication Table
//
//  Created by Mike on 20.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct PlayOneNumMT {

    
//MARK: - VARIABLES
    //Первое постоянное число для умножения. Назначается из главного меню
    let firstNum = Ex.numToTrain
    
    //Максимальное значение для второго случайного числа.
    private var maxSecondNum = 10
    
    //Предыдущее случайное число. Для исключения повторений
    private var previosRandomNum = 0
    //Правильный ответ
    private var rightAnswer = 0
    
    //Количество правильных ответов. Изначально берется из констант и будет уменьшаться
    var countRightAnswers = K.PlayOne.maxRightAnswers
    //Количество неправильных ответов. Изначально равно 0
    var countWrongAnswers = 0
    
    
//MARK: - OBJECTS
    private let save = SaveData.singletonSaveData
    
    
//MARK: - ГЕНЕРАЦИЯ СЛУЧАЙНОГО УРАВНЕНИЯ
    mutating func randomEquation() -> String {
        let first = firstNum
        var second = Int.random(in: 1...maxSecondNum)
        //Защита от повторяющихся значений
        while true {
            if second == previosRandomNum {
                second = Int.random(in: 1...maxSecondNum)
            } else{
                break
            }
        }
        previosRandomNum = second
        rightAnswer = first * second
        let equation = "\(first) x \(second) = ?"
        return equation
    }

    
//MARK: - ПРОВЕРКА ОТВЕТА
    mutating func checkAnswer(answer: String) -> Bool {
        //Правильный ответ
        if answer == "\(rightAnswer)" {
            countRightAnswers -= 1
        //Увеличиваем значение всех решенных примеров
            save.saveTotalSolved()
            return true
        //Неправильный ответ
        } else {
            countRightAnswers += 1
            countWrongAnswers -= 1
            return false
        }
    }
    
//MARK: - ПРОВЕРКА КОНЦА ИГРЫ. ВСЕ ПРИМЕРЫ РЕШЕНЫ ИЛИ ПРЕВЫШЕНО ЧИСЛО НЕПРАВИЛЬНЫХ ОТВЕТОВ
    func checkEndGame() -> Bool {
        //Превышен лимит неправильных ответов
        if countWrongAnswers <= -K.PlayOne.maxWrongAnswers {
             return true
        //Игра продолжается
        } else if countRightAnswers > 0 {
            return false
        //Решены все примеры
        } else {
            return true
        }
    }
}
