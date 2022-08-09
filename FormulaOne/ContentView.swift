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
    
    let loadData = LoadData()
    
    var body: some View {
        NavigationView{
            List(results, id:\.team.id) { teams in
                ZStack {
                    VStack {
                        HStack {
                            AsyncImage(url: URL(string: teams.team.logo)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                            VStack(alignment: .leading) {
                                Text(teams.team.name)
                                    .font(
                                        .title2
                                        .weight(.bold)
                                    )
                                    .lineLimit(2)
                                Spacer()
                                    .frame(height: 15)
                                Text("\(teams.points) Points")
                                    .font(.system(size: 16))
                                    .lineLimit(1)
                            } .padding(.leading, 8)
                            
                        }
                    }
                }
            }
            .task {
                loadData.endPoint = "rankings/teams?season=2022"
                loadData.LoadDataNow{
                    (teams) in self.results = teams
                    self.image = teams[0].team.logo
                    print(results)
                }
            }
            .navigationBarTitle(Text("F1 Ranking"), displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
