//
//  ContentView.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 08/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var results = [Teams]()
    
    var body: some View {
        Button("Load") {
            let loadData = LoadData()
            loadData.endPoint = "rankings/teams?season=2022"
            loadData.LoadDataNow{
                (teams) in self.results = teams
                print(results)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
