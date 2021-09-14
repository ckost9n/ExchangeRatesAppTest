//
//  Valute.swift
//  ExchangeRatesAppTest
//
//  Created by Konstantin on 14.09.2021.
//

import Foundation

struct Excahnge: Decodable {
    let date: Date
    let previousDate: Date
    let previousUrl: String
    let timestamp: Date
    let valute: [Valute]
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case previousDate = "PreviousDate"
        case previousUrl = "PreviousURL"
        case timestamp = "Timestamp"
        case valute = "Valute"
    }
}

struct Valute: Decodable {
    let id: String
    let numCode: String
    let charCode: String
    let nominal: Int
    let name: String
    let value: Double
    let previousValue: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numCode = "NumCode"
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previousValue = "Previous"
    }
    
}
