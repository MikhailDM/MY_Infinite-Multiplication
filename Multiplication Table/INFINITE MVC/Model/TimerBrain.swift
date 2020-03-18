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
    private var timerTime = 0
    private var secondsPast = 0
    
    
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
        timerTime = getTotalTime()
        secondsPast = getTotalTime()
    }

//MARK: - TIMER. ПОЛУЧЕНИЕ ВРЕМЕНИ ОТ РЕЖИМА
    @objc private func getTotalTime() -> Int {
        if Ex.numToTrain == 10 {
            //print("TIME IS: \(K.PlayInf.totalTimeToAnswerX10)")
            return K.PlayInf.totalTimeToAnswerX10
        } else {
            //print("TIME IS: \(K.PlayInf.totalTimeToAnswerX20)")
            return K.PlayInf.totalTimeToAnswerX20
        }
    }

}
