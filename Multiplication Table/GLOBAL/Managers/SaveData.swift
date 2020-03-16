//
//  SaveData.swift
//  Multiplication Table
//
//  Created by Mike on 06.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import Foundation

class SaveData {
//MARK: - OBJECTS
    
    let defaults = UserDefaults.standard
    static let singletonSaveData = SaveData()
    
//MARK: - PRO ВЕРСИЯ
    
    //Имя для сохранения
    private let proVersion = "ProVersion"
    
    //Метод сохранения
    func savePRO(isPRO: Bool) {
        defaults.set(isPRO, forKey: proVersion)
    }
    //Метод получения
    func getPRO() -> Bool {
        let isPRO = defaults.bool(forKey: proVersion)
        return isPRO
    }
    

//MARK: - ОБЩЕЕ ЧИСЛО ПРАВИЛЬНО РЕШЕННЫХ ПРИМЕРОВ
    
    //Имя для сохранения
    private let totalSolved = "TotalEquationsSolved"
    
    //Метод сохранения. При вызове поднимаем на единичку и сохраняем
    func saveTotalSolved() {
        let total = getTotalSolved() + 1
        defaults.set(total, forKey: totalSolved)
    }
    //Метод получения
    func getTotalSolved() -> Int {
        let total = defaults.integer(forKey: totalSolved)
        return total
    }
    

//MARK: - БЕСКОНЕЧНАЯ ТАБЛИЦА УМНОЖЕНИЯ x10. ЛУЧШИЙ РЕЗУЛЬТАТ
    
    //Имя для сохранения
    private let maxScoreNameX10 = "MaxScoreX10"
    
    //Метод сохранения. МОЖНО СДЕЛАТЬ РЕАЛИЗАЦИЮ ТУТ
    func saveMaxScoreX10(score: Int) {
        defaults.set(score, forKey: maxScoreNameX10)
    }
    //Метод получения
    func getMaxScoreX10() -> Int {
        let maxScore = defaults.integer(forKey: maxScoreNameX10)
        return maxScore       
    }
    

//MARK: - БЕСКОНЕЧНАЯ ТАБЛИЦА УМНОЖЕНИЯ x20. ЛУЧШИЙ РЕЗУЛЬТАТ

    //Имя для сохранения
    private let maxScoreNameX20 = "MaxScoreX20"
    
    //Метод сохранения. МОЖНО СДЕЛАТЬ РЕАЛИЗАЦИЮ ТУТ
    func saveMaxScoreX20(score: Int) {
        defaults.set(score, forKey: maxScoreNameX20)
    }
    
    //Метод получения
    func getMaxScoreX20() -> Int {
        let maxScore = defaults.integer(forKey: maxScoreNameX20)
        return maxScore
    }
    
    
//MARK: - МАССИВ ПРОРЕШЕННЫХ ОТДЕЛЬНЫХ ЧИСЕЛ
    
    //Имя для сохранения массива
    private let allSolvedNumsArrName = "AllSolvedNumsArr"
    
    //Метод сохранения числа в словарь типа [Int]
    func saveSolvedNumsMap(numToSave: Int) {
        //Проверка есть ли заданное число в массиве
        if !getSolvedNumsState(numToCheck: numToSave) {
            //Добавление нового числа в массив и сохранение
            if let currentArr = defaults.array(forKey: allSolvedNumsArrName) {
                var array = currentArr as! [Int]
                array.append(numToSave)
                defaults.set(array, forKey: allSolvedNumsArrName)
                print("SAVE: \(numToSave)")
            //Добавление при первой записи в пустой массив
            } else {
                let array = [numToSave]
                defaults.set(array, forKey: allSolvedNumsArrName)
                print("SAVE IN EMPTY: \(numToSave)")
            }
        } else {
            print("ALREADY SOLVED NUM")
        }
    }
        
    //Метод который проверяет есть ли уже такая цифра в массиве. False - цифра отсутствует.
    func getSolvedNumsState(numToCheck: Int) -> Bool {        
        //Проверка - Существует ли словарь типа [String: Bool]
        if let currentArr = defaults.array(forKey: allSolvedNumsArrName) {
            let array = currentArr as! [Int]
            //Цифра есть
            if array.contains(numToCheck) {
                return true
            //Цифры нет
            } else {
                return false
            }
        //Если словаря еще нет - то и никаких записей нет
        } else {
            return false
        }
    }
    
    
//MARK: - END
}

