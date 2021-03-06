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
    //Общее число достижений
    private var arrayOfAchieves = [String]()
    

//MARK: - МЕТОД ПРОВЕРКИ ДОСТИЖЕНИЙ
    mutating func checkAchievement(id: String) -> Bool {
        switch id {
        //Решить свой первый пример
        case "LevelsAch00":
            if save.getTotalSolved() > 0 {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
        //Решить определенное количество примеров
        case "LevelsAch01":
            if save.getTotalSolved() >= levels[1].levelRequirement {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
            
        //Решить определенное количество примеров
        case "LevelsAch02":
            if save.getTotalSolved() >= levels[2].levelRequirement {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
            
        //Решить определенное количество примеров
        case "LevelsAch03":
            if save.getTotalSolved() >= levels[3].levelRequirement {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
            
        //Решить определенное количество примеров
        case "LevelsAch04":
            if save.getTotalSolved() >= levels[4].levelRequirement {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
            
        //Прорешать все числа от 1 до 5
        case "NumsAch01":
            let checkArray = [1, 2, 3, 4, 5]
            var isAllSolved = true
            for num in checkArray {
                guard save.getSolvedNumsState(numToCheck: num) else {
                    isAllSolved = false
                    break
                }
            }
            if isAllSolved {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
            
        //Прорешать все числа от 1 до 10
        case "NumsAch02":
            let checkArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
            var isAllSolved = true
            for num in checkArray {
                guard save.getSolvedNumsState(numToCheck: num) else {
                    isAllSolved = false
                    break
                }
            }
            if isAllSolved {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
            
        //Прорешать все числа от 1 до 15
        case "NumsAch03":
            let checkArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
            var isAllSolved = true
            for num in checkArray {
                guard save.getSolvedNumsState(numToCheck: num) else {
                    isAllSolved = false
                    break
                }
            }
            if isAllSolved {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
            
        //Прорешать все числа от 1 до 20
        case "NumsAch04":
            let checkArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
            var isAllSolved = true
            for num in checkArray {
                guard save.getSolvedNumsState(numToCheck: num) else {
                    isAllSolved = false
                    break
                }
            }
            if isAllSolved {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
            
            
        //X10. ПЕРВОЕ ДОСТИЖЕНИЕ
        case "X10Ach01":
            if save.getMaxScoreX10() >= K.PlayInf.x10FirstLevel {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
        //X10. ВТОРОЕ ДОСТИЖЕНИЕ
        case "X10Ach02":
            if save.getMaxScoreX10() >= K.PlayInf.x10SecondLevel {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
        //X10. ТРЕТЬЕ ДОСТИЖЕНИЕ
        case "X10Ach03":
            if save.getMaxScoreX10() >= K.PlayInf.x10ThirdLevel {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
        //X20. ПЕРВОЕ ДОСТИЖЕНИЕ
        case "X20Ach01":
            if save.getMaxScoreX20() >= K.PlayInf.x20FirstLevel {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
        //X20. ВТОРОЕ ДОСТИЖЕНИЕ
        case "X20Ach02":
            if save.getMaxScoreX20() >= K.PlayInf.x20SecondLevel {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
        //X20. ТРЕТЬЕ ДОСТИЖЕНИЕ
        case "X20Ach03":
            if save.getMaxScoreX20() >= K.PlayInf.x20ThirdLevel {
                checkAchArray(id: id)
                return true
            } else {
                return false
            }
            
        //ВСЕ ДОСТИЖЕНИЯ
        case "AllAchieves":
            if checkAllAchievements() {
                return true
            } else {
                return false
            }
            
        //Стандартное значение
        default:
            return false
        }
        
    }
    
    
//MARK: - МЕТОД ПРОВЕРКИ ВСЕХ ДОСТИЖЕНИЙ
    private func checkAllAchievements() -> Bool {
        if arrayOfAchieves.count == achieves.count - 1 {
            print("ALL ACH")
            return true
        } else {
            print("SUM OF ACH: \(arrayOfAchieves.count)")
            return false
        }
        
    }

//MARK: - МЕТОД НАПОЛНЕНИЯ СЛОВАРЯ ДОСТИЖЕНИЙ
    mutating private func checkAchArray(id: String) {
        if !arrayOfAchieves.contains(id) {
            arrayOfAchieves.append(id)
            print(id)
        }
    }
}


