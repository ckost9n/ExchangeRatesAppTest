//
//  Network.swift
//  ExchangeRatesAppTest
//
//  Created by Konstantin on 14.09.2021.
//

import Foundation

//class NetworkService {
//    
//    private let urlValute = "https://www.cbr-xml-daily.ru/daily_json.js"
//    
//    public func getValue() {
//        
//        guard let url = URL(string: urlValute) else { return }
//        
//        let session = URLSession.shared
//        
//        session.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let values = try JSONDecoder().decode(Valute.self, from: data)
//                DispatchQueue.main.async {
//                    
//                }
//            } catch {
//                print(error)
//            }
//        }.resume()
//        
//    }
//}
