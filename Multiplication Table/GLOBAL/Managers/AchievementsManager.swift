//
//  AchievementsData.swift
//  Multiplication Table
//
//  Created by Mike on 22.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

struct AchievementsManager {
//MARK: - OBJECTS
    private let save = SaveData.singletonSaveData
    
 
//MARK: - VARIABLES
    //Массив достижений
    private let achieves = K.achievementsArray
    //Массив уровней
    private let levels = K.levelsArray
    

//MARK: - МЕТОД ПРОВЕРКИ ДОСТИЖЕНИЙ
    func checkAchievement(id: String) -> Bool {
        switch id {
        //Решить свой первый пример
        case "LevelsAch00":
            if save.getTotalSolved() > 0 {
                return true
            } else {
                return false
            }
        //Решить определенное количество примеров
        case "LevelsAch01":
            if save.getTotalSolved() >= levels[1].levelRequirement {
            return true
        } else {
            return false
        }
            
        //Решить определенное количество примеров
        case "LevelsAch02":
            if save.getTotalSolved() >= levels[2].levelRequirement {
            return true
        } else {
            return false
        }
            
        //Решить определенное количество примеров
        case "LevelsAch03":
            if save.getTotalSolved() >= levels[3].levelRequirement {
            return true
        } else {
            return false
        }
            
        //Решить определенное количество примеров
        case "LevelsAch04":
            if save.getTotalSolved() >= levels[4].levelRequirement {
            return true
        } else {
            return false
        }
            
        //Прорешать все числа от 1 до 5
        case "LevelsAch20":
            let checkArray = [1, 2, 3, 4, 5]
            var isAllSolved = true
            for num in checkArray {
                guard save.getSolvedNumsState(numToCheck: num) else {
                    isAllSolved = false
                    break
                }
            }
            return isAllSolved
            
        //Прорешать все числа от 1 до 10
        case "LevelsAch21":
            let checkArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
            var isAllSolved = true
            for num in checkArray {
                guard save.getSolvedNumsState(numToCheck: num) else {
                    isAllSolved = false
                    break
                }
            }
            return isAllSolved
        
        //Прорешать все числа от 1 до 15
        case "LevelsAch22":
            let checkArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
            var isAllSolved = true
            for num in checkArray {
                guard save.getSolvedNumsState(numToCheck: num) else {
                    isAllSolved = false
                    break
                }
            }
            return isAllSolved
            
        //Прорешать все числа от 1 до 20
        case "LevelsAch23":
            let checkArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
            var isAllSolved = true
            for num in checkArray {
                guard save.getSolvedNumsState(numToCheck: num) else {
                    isAllSolved = false
                    break
                }
            }
            return isAllSolved
            
            
            
        //Стандартное значение
        default:
            return false
        }
        
    }

}


