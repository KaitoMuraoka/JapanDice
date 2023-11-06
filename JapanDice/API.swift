//
//  API.swift
//  JapanDice
//
//  Created by 村岡海人 on 2022/01/11.
//

import UIKit

struct CongestionAPI {
    static func getTotal(completion: @escaping ([CongestionInfo.Total]) -> Void) {
        let url = URL(string: "https://data.corona.go.jp/converted-json/reduction_rate_tourist_site.json")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("error: \(error!.localizedDescription)")
            }
            if let data = data {
                let result = try! JSONDecoder().decode([CongestionInfo.Total].self, from: data)
                completion(result)
            }
        }.resume()
    }
}
