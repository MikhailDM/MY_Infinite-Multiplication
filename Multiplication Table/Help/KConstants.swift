//
//  KConstants.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

struct K {
//MARK: - КОНСТАНТЫ ГЛАВНОГО МЕНЮ
    
    struct MainMenu {
        //Общее число кнопок для тренировки таблицы умножения
        //static let maxNumberToTrain = 20
        
        //Максимальное значение для решенных примеров, которое нужно достичь
        static let maxTotalSolvedEquations = 100
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
       

//MARK: - КОНСТАНТЫ ВВОДА
    
    struct InputSettings {
        //Максимальная длина ввода символов
        static let maxAnswerLength = 3
        static let startAnswerText = "ВВЕДИТЕ ОТВЕТ"
    }
    
//MARK: - КОНСТАНТЫ БЕСКОНЕЧНОГО УМНОЖЕНИЯ
    struct PlayInf {
        
    }
    
    
//MARK: - КОНСТАНТЫ УМНОЖЕНИЯ НА 1 ЧИСЛО
    struct PlayOne {
        //Необходимое число правильных ответов для прохождения цифры
        static let maxRightAnswers = 2
        //Число неправильных ответов для прохождения тренировки
        static let maxWrongAnswers = 1
    }
    
        
//MARK: - КОНСТАНТЫ NAVIGATION
    
    //Имена переходов
    struct Segues {
        //Segue к бесконечной таблице умножения
        static let infinitePlaySegue = "InfinitePlaySegue"
        
        //Segue к выбору цифры для умножения
        static let chooseNumSegue = "ChooseNumSegue"
        //Дальнейший Segue к тренировке с 1 цифрой
        static let playOneNumSegue = "PlayOneNumSegue"
        
        //Segue к достижениям
        static let achieveSegue = "AchieveSegue"
        
    }
    
    
//MARK: - КОНСТАНТЫ ДОСТИЖЕНИЙ
    
    //Имена шрифтов
    struct Achieve {
        static let cellID = "achieveCell"
        static let cellName = "AchieveTableViewCell"
        
    }
    
    
//MARK: - КОНСТАНТЫ ШРИФТОВ
    
    //Имена шрифтов
    struct Fonts {
        //Уровень масштабируемости текста
        static let scaleFactor: CGFloat = 0.5
        
        //Основные шрифты
        static let maintF = "Futura-Bold"
        
        //Основные размеры шрифтов
        static var size30: CGFloat = 30
    }
    
    
//MARK: - КОНСТАНТЫ ЦВЕТОВ
    
    //Имена шрифтов
    struct MyColors {
        static let backGround = UIColor.init(named: "MyBackground")
        static let green = UIColor.init(named: "MyGreen")
        static let white = UIColor.init(named: "MyWhite")
        
    }
}
