//
//  TimerBrain.swift
//  Multiplication Table
//
//  Created by Mike on 17.03.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

class TimerBrain {
    //Синглтон
    static let singletonTimerBrain = TimerBrain()
    //Прячем инициализатор
    private init(){}

//MARK: - VARIABLES
    //Переменные для таймера
    var timerTime = K.PlayInf.totalTimeToAnswerX10
    var secondsPast = K.PlayInf.totalTimeToAnswerX10
    
    
//MARK: - TIMER. ПРОГРЕСС ТАЙМЕРА
    @objc func getTimerProgress() -> Float {
        secondsPast -= 1
        let progress = Float(secondsPast) / Float(timerTime)
        return progress
    }
    
    
//MARK: - TIMER. ПРОВЕРКА НА ИСТЕЧЕННОЕ ВРЕМЯ
    @objc func isTimeOver() -> Bool {
        if secondsPast > 0 {
            return false
        } else {
            return true
        }
    }
//MARK: - TIMER. ОБНУЛЕНИЕ ЗНАЧЕНИЙ
    @objc func resetTimer(){
        timerTime = K.PlayInf.totalTimeToAnswerX10
        secondsPast = K.PlayInf.totalTimeToAnswerX10
    }

}
