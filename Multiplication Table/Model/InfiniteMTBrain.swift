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
    //Максимальная длина поля ответа
    let maxAnswerLength = 6
    
    let startAswerText = "ВВЕДИТЕ ОТВЕТ"
    
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
}


//MARK: - Функция генерации случайного уравнения
