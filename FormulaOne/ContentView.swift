//
//  ContentView.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 08/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var results = [Teams]()
    @State var image = ""
    
    var body: some View {
        if (image != "") {
            AsyncImage(url: URL(string: image))
        }
        Button("Load") {
            let loadData = LoadData()
            loadData.endPoint = "rankings/teams?season=2022"
            loadData.LoadDataNow{
                (teams) in self.results = teams
                self.image = teams[0].team.logo
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
