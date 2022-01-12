//
//  Entity.swift
//  JapanDice
//
//  Created by 村岡海人 on 2022/01/11.
//

import Foundation

struct CongestionInfo: Codable {
    
    struct Total: Codable {
        var date: String
        var area: String
        var dataName: String
        var comparisonPreDay: String
        var comparisonPreYear: String
    }
}
