//
//  CongestionSingleton.swift
//  JapanDice
//
//  Created by 村岡海人 on 2022/01/12.
//

import Foundation

class CongestionSingleton {
    
    private init(){}
    static let shared = CongestionSingleton()
    var sightseeing: [CongestionInfo.Total] = []
}
