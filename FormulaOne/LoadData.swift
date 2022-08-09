//
//  LoadData.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 08/08/22.
//

import Foundation

class LoadData {
    let apiKey = "447f7e6c3351cc529ad5ceeb8ed52c1a"
    let host = "v1.formula-1.api-sports.io"
    
    var endPoint = ""
    
    var responsTemp: Data?
    var responsStatus = false
    
    var fOneAPI: [Teams]?
    
    func LoadDataNow() async {
        guard let url = URL(string: "https://v1.formula-1.api-sports.io/\(endPoint)") else {
            fatalError("Invalid URL")
                }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("\(apiKey)", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("\(host)", forHTTPHeaderField: "x-rapidapi-host")
         
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, let data = data else { return }
                
                if response.statusCode == 200 {
                    
                    // Use If else to detech the decode
                    
                    self.responsTemp = data
                    self.responsStatus = true
                    print("Fetch Data Complete")
                    print(self.responsStatus)
                    
                } else {
                    print("ERROR: \(data), HTTP Status: \(response.statusCode)")
                }
            }
        }
         
        task.resume()
    }
    
    func DataToFOneAPI() {
        if responsStatus {
            let decoder = JSONDecoder()
            
            if let fOne = try? decoder.decode(FOneAPI.self, from: responsTemp!) as FOneAPI {
                self.fOneAPI = fOne.response
                print("SUCCESS: Success Decode JSON")
            } else {
                print("ERROR: Can't Decode JSON")
            }
        } else {
            print("ERROR: Fetch Data not Complete")
        }
        self.responsStatus = false
        
    }
    
}
