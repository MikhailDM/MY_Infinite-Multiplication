//
//  TimerBrain.swift
//  Multiplication Table
//
//  Created by Mike on 15.03.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

class TimerBrain {
    //Переменные для таймера
    private let timerTime = K.PlayInf.totalTimeToAnswer
    private var secondsPast = K.PlayInf.totalTimeToAnswer
    
    
    //Функция уменьшения времени
    @objc func timerCount() -> Float {
        secondsPast -= 1
        let progress = Float(secondsPast) / Float(timerTime)
        return progress
    }
}
