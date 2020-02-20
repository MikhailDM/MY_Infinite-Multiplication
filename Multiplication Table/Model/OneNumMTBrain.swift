//
//  OneNumMTBrain.swift
//  Multiplication Table
//
//  Created by Mike on 20.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct PlayOneNumMT {
//MARK: - OBJECTS
    let save = SaveData.singletonSaveData
    
    
//MARK: - VARIABLES
    //Первое постоянное число для умножения. Назначается из главного меню
    var firstNum = Ex.numToTrain
    
    //Максимальное значение для второго случайного числа. Зависит от первого числа
    var maxSecondNum: Int {
        if firstNum <= 10 {
            return 10
        } else {
            return 20
        }
    }
    //Предыдущее случайное число. Для исключения повторений
    var previosRandomNum = 0
    //Правильный ответ
    var rightAnswer = 0
    
    //Количество правильных ответов. Изначально берется из констант и будет уменьшаться
    var countRightAnswers = K.PlayOne.maxRightAnswers
    //Количество неправильных ответов. Изначально равно 0
    var countWrongAnswers = 0
    
    
//MARK: - Функция генерации случайного уравнения
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

    
//MARK: - Функция проверки ответа

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
    
//MARK: - Функция проверки конца игры. Когда решены все примеры или превышено число неправильных ответов
    
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
