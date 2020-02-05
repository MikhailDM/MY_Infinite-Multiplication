//
//  QuotesData.swift
//  Multiplication Table
//
//  Created by Mike on 04.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

struct Quotes {
    
    //Метод возвращающий случайную цитату    
    func randomQuote() -> String {
        return qAray.randomElement()!
    }
    
    //Массив цитат
    private let qAray = [
    "Все искусства тяготеют к музыке; все науки – к математике.\nДжордж Сантаяна",
    "Он стал поэтом – для математики у него не хватало фантазии.\nДавид Гильберт",
    "Между духом и материей посредничает математика.\nХуго Штейнхаус"
    ]
}
