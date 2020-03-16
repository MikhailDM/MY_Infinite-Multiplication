//
//  KConstants.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

struct K {
//MARK: - МАССИВ УРОВНЕЙ
    static let levelsArray = [
        LevelModel(levelName: "НОВИЧОК", levelRequirement: 0),
        LevelModel(levelName: "УЧЕНИК", levelRequirement: 2),
        LevelModel(levelName: "СТУДЕНТ", levelRequirement: 5),
        LevelModel(levelName: "МАТЕМАТИК", levelRequirement: 7),
        LevelModel(levelName: "ПРОФЕССОР", levelRequirement: 10)
    ]
 
    
//MARK: - МАССИВ ДОСТИЖЕНИЙ
    static let achievementsArray = [
        AchievementModel(id: "LevelsAch00",
                         titleAch: levelsArray[0].levelName,
                         descriptionAch: "РЕШИТЬ СВОЙ ПЕРВЫЙ ПРИМЕР"),
        
        AchievementModel(id: "LevelsAch01",
                          titleAch: levelsArray[1].levelName,
                          descriptionAch: "РЕШИТЬ ПРИМЕРОВ: \(levelsArray[1].levelRequirement)"),
        
        AchievementModel(id: "LevelsAch02",
                          titleAch: levelsArray[2].levelName,
                          descriptionAch: "РЕШИТЬ ПРИМЕРОВ: \(levelsArray[2].levelRequirement)"),
        
        AchievementModel(id: "LevelsAch03",
                          titleAch: levelsArray[3].levelName,
                          descriptionAch: "РЕШИТЬ ПРИМЕРОВ: \(levelsArray[3].levelRequirement) "),
        
        AchievementModel(id: "LevelsAch04",
                          titleAch: levelsArray[4].levelName,
                          descriptionAch: "РЕШИТЬ ПРИМЕРОВ: \(levelsArray[4].levelRequirement)"),
        
        AchievementModel(id: "LevelsAch20",
                         titleAch: "УЧИМСЯ УМНОЖАТЬ",
                         descriptionAch: "ПРОРЕШАТЬ ВСЕ ЧИСЛА ОТ 1 ДО 5"),
        
        AchievementModel(id: "LevelsAch21",
                         titleAch: "МАСТЕР УМНОЖЕНИЯ",
                         descriptionAch: "ПРОРЕШАТЬ ВСЕ ЧИСЛА ОТ 1 ДО 10"),
        
        AchievementModel(id: "LevelsAch22",
                         titleAch: "МАГИСТР УМНОЖЕНИЯ",
                         descriptionAch: "ПРОРЕШАТЬ ВСЕ ЧИСЛА ОТ 1 ДО 15"),
        
        AchievementModel(id: "LevelsAch23",
                         titleAch: "ПОВЕЛИТЕЛЬ УМНОЖЕНИЯ",
                         descriptionAch: "ПРОРЕШАТЬ ВСЕ ЧИСЛА ОТ 1 ДО 20"),
    ]

    
//MARK: - КОНСТАНТЫ PREMIUM
    
    struct Premium {
        //Отображаемый текст для Free версии
        static let freeVersionText = "XXX"
        //Alpha для Free кнопок
        static var alphaFree: CGFloat = 0.3
    }


//MARK: - КОНСТАНТЫ ВВОДА
    
    struct InputSettings {
        //Максимальная длина ввода символов
        static let maxAnswerLength = 3
        static let startAnswerText = "ВВЕДИТЕ ОТВЕТ"
    }
    
    
//MARK: - КОНСТАНТЫ БЕСКОНЕЧНОГО УМНОЖЕНИЯ
    struct PlayInf {
        static let totalTimeToAnswer = 10
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
        
        //Segue к теории
        static let theorySegue = "TheorySegue"
        
        //Segue к достижениям
        static let achieveSegue = "AchieveSegue"
        
        //Segue к Premium
        static let premiumSegue = "PremiumSegue"
        
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
        static let mainF = "Futura-Bold"
        static let mainFMedium = "Futura-Medium"
        
        //Основные размеры шрифтов
        static var size30: CGFloat = 30
    }
    
    
//MARK: - КОНСТАНТЫ ЦВЕТОВ
    
    //Имена шрифтов
    struct MyColorsUI {
        static let backGround = UIColor.init(named: "MyBackground")
        static let green = UIColor.init(named: "MyGreen")
        static let blue = UIColor.init(named: "MyBlue")
        static let white = UIColor.init(named: "MyWhite")
        
    }
    
    
}