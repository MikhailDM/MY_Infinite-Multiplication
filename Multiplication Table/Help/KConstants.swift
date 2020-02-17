//
//  KConstants.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

struct K {
//MARK: - КОНСТАНТЫ ГЛАВНОГО МЕНЮ
    
    struct MainMenu {
        //Общее число кнопок для тренировки таблицы умножения
        static let maxNumberToTrain = 20
        
        //Максимальное значение для решенных примеров
        static let maxTotalSolvedEquations = 10
        //Текст прогресса
        static let progressText = "ТЕКУЩИЙ УРОВЕНЬ: "
        
        //Необходимое число решенных примеров для получения уровня
        static let levelsCharge = [2, 5, 7, maxTotalSolvedEquations]
        //Уровни
        static let levels = [
            "НОВИЧОК",//0
            "УЧЕНИК",//1
            "СТУДЕНТ",//2
            "МАТЕМАТИК",//3
            "ПРОФЕССОР",//4
        ]
    }
       
   
//MARK: - КОНСТАНТЫ NAVIGATION
    
    //Имена переходов
    struct Segues {
        //Segue к бесконечной таблице умножения
        static let infinitePlaySegue = "InfinitePlaySegue"
    }    
}
