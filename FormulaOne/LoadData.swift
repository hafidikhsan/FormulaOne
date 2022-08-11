//
//  LoadData.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 08/08/22.
//

import Foundation

class LoadData: ObservableObject {
    let url = "https://v1.formula-1.api-sports.io/"
    let apiKeyHeader = "x-rapidapi-key"
    let apiKey = "447f7e6c3351cc529ad5ceeb8ed52c1a"
    let hostHeader = "x-rapidapi-host"
    let host = "v1.formula-1.api-sports.io"
    
    var endPoint = ""
    
    var fOneAPI: [Teams]?
    var fOneAPIDetail: [Detail]?
    
    @Published var isError = false
    
    func LoadDataNow(completion:@escaping ([Teams]) -> ()) {
        self.isError = false
        guard let url = URL(string: url+endPoint) else { self.isError = true; fatalError("Invalid URL") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: apiKeyHeader)
        request.setValue(host, forHTTPHeaderField: hostHeader)
         
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, let data = data else { self.isError = true; return }
                
                if response.statusCode == 200 {
                    
                    let decoder = JSONDecoder()
                    
                    if let fOne = try? decoder.decode(FOneAPI.self, from: data) as FOneAPI {
                        completion(fOne.response)
                        if (fOne.results != 0) {
                            print("SUCCESS: Success Decode JSON")
                        } else {
                            self.isError = true
                        }
                    } else {
                        self.isError = true
                        print("ERROR: Can't Decode JSON")
                    }
                    
                } else {
                    self.isError = true
                    print("ERROR: \(data), HTTP Status: \(response.statusCode)")
                }
            }
        }
         
        task.resume()
        print(isError)
    }
    
    func LoadDetail(completion:@escaping ([Detail]) -> ()) {
        self.isError = false
        guard let url = URL(string: url+endPoint) else { self.isError = true; fatalError("Invalid URL") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: apiKeyHeader)
        request.setValue(host, forHTTPHeaderField: hostHeader)
         
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, let data = data else { self.isError = true; return }
                
                if response.statusCode == 200 {
                    
                    let decoder = JSONDecoder()
                    
                    if let fOne = try? decoder.decode(TeamDetail.self, from: data) as TeamDetail {
                        completion(fOne.response)
                        if (fOne.results != 0) {
                            print("SUCCESS: Success Decode JSON")
                        } else {
                            self.isError = true
                        }
                    } else {
                        self.isError = true
                        print("ERROR: Can't Decode JSON")
                    }
                    
                } else {
                    self.isError = true
                    print("ERROR: \(data), HTTP Status: \(response.statusCode)")
                }
            }
        }
         
        task.resume()
    }
    
}
