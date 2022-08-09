//
//  LoadData.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 08/08/22.
//

import Foundation

class LoadData {
    let url = "https://v1.formula-1.api-sports.io/"
    let apiKeyHeader = "x-rapidapi-key"
    let apiKey = "447f7e6c3351cc529ad5ceeb8ed52c1a"
    let hostHeader = "x-rapidapi-host"
    let host = "v1.formula-1.api-sports.io"
    
    var endPoint = ""
    
    var fOneAPI: [Teams]?
    
    func LoadDataNow(completion:@escaping ([Teams]) -> ()) {
        guard let url = URL(string: url+endPoint) else { fatalError("Invalid URL") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: apiKeyHeader)
        request.setValue(host, forHTTPHeaderField: hostHeader)
         
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, let data = data else { return }
                
                if response.statusCode == 200 {
                    
                    let decoder = JSONDecoder()
                    
                    if let fOne = try? decoder.decode(FOneAPI.self, from: data) as FOneAPI {
                        completion(fOne.response)
                        print("SUCCESS: Success Decode JSON")
                    } else {
                        print("ERROR: Can't Decode JSON")
                    }
                    
                } else {
                    print("ERROR: \(data), HTTP Status: \(response.statusCode)")
                }
            }
        }
         
        task.resume()
    }
    
}
