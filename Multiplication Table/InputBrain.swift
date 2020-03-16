//
//  InputBrain.swift
//  Multiplication Table
//
//  Created by Mike on 20.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct InputBrain {
    
    
    //MARK: - Функция проверки ввода чисел в поле ответа
    func checkEnter(numToAdd: String, currentText: String) -> String {
        if currentText == K.InputSettings.startAnswerText {
            return numToAdd
        } else if currentText.count >= K.InputSettings.maxAnswerLength {
            return currentText
        } else {
            return (currentText + numToAdd)
        }
    }
    
    
    //MARK: - Функция удаление последнего символа поля ответа
    func delLastNum(currentText: String) -> String {
        let startT = K.InputSettings.startAnswerText
        if currentText == startT {
            return startT
        } else if currentText.count <= 1 {
            return startT
        } else {
            return (String(currentText.dropLast()))
        }
    }
    
    
    
}
