//
//  ContentView.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 08/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var results = [Teams]()
    
    let loadData = LoadData()
    
    var body: some View {
        Button("Load") {
            Task {
                loadData.endPoint = "rankings/teams?season=2022"
                do {
                    await loadData.LoadDataNow()
                    print(loadData.responsStatus)
                }
                if loadData.responsStatus {
                    loadData.DataToFOneAPI()
                    results = loadData.fOneAPI!
                    print("results")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
