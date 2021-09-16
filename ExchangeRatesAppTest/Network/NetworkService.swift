//
//  Network.swift
//  ExchangeRatesAppTest
//
//  Created by Konstantin on 14.09.2021.
//

import Foundation

class NetworkService {
    
    static private let urlValute = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    static func fetchData(complition: @escaping (Excahnge) -> ()) {
        
        guard let url = URL(string: urlValute) else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let exchangeJson = try JSONDecoder().decode(Excahnge.self, from: data)
                DispatchQueue.main.async {
                    complition(exchangeJson)
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }
}
