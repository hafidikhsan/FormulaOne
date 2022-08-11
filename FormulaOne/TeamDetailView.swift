import SwiftUI

struct TeamDetailView: View {
    
    @State var results = [Detail]()
    var standing: Int
    var teamId: Int
    var points: Int
    
    @ObservedObject var loadData = LoadData()
    
    var body: some View {
        if (results.isEmpty) {
            if (loadData.isError == true) {
                ErrorView()
            } else {
                ZStack {
                    Color.white
                    ProgressView()
                }
                .task {
                    loadData.endPoint = "teams?id=\(teamId)"
                    loadData.LoadDetail{
                        (teams) in self.results = teams
                    }
                }
            }
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    ZStack(alignment: .top) {
                        Color.red.frame(height: 150)
                        VStack {
                            Spacer().frame(height: 80)
                            AsyncImage(url: URL(string: results[0].logo)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(Color.white, lineWidth: 5)
                            )
                            .shadow(radius: 10)
                            Text(results[0].name)
                                .font(.title2.weight(.bold))
                                .padding(.top)
                            Text(results[0].base)
                                .font(.headline.weight(.regular))
                                .foregroundColor(Color.gray)
                                .padding(.bottom)
                        }
                    }
                    HStack {
                        Spacer()
                        Image("F1Logo")
                            .resizable()
                            .frame(width: 60, height: 20)
                        Spacer()
                        
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Text("\(points)")
                                .font(.title.weight(.bold))
                            Text("Points")
                        }
                        Spacer()
                        Divider()
                        Spacer()
                        VStack {
                            Text("\(standing)")
                                .font(.title.weight(.bold))
                            Text("Standings")
                        }
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text("Teams")
                            .font(.title3.weight(.bold))
                            .foregroundColor(Color.gray)
                            .padding()
                        VStack(alignment: .leading) {
                            Text(results[0].president)
                                .font(.title3.weight(.bold))
                            Text("President")
                                .font(.headline.weight(.regular))
                                .foregroundColor(Color.gray)
                        }.padding(.leading)
                        VStack(alignment: .leading) {
                            Text(results[0].director)
                                .font(.title3.weight(.bold))
                            Text("Team Principal")
                                .font(.headline.weight(.regular))
                                .foregroundColor(Color.gray)
                        }.padding(.leading).padding(.top)
                        VStack(alignment: .leading) {
                            Text(results[0].technical_manager)
                                .font(.title3.weight(.bold))
                            Text("Technical Director")
                                .font(.headline.weight(.regular))
                                .foregroundColor(Color.gray)
                        }.padding(.leading).padding(.top)
                    }
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Image("Trophy")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text("\(results[0].world_championships)")
                                    .font(.title.weight(.bold))
                            }
                            Text("World Champions")
                        }
                        Spacer()
                        Divider()
                        Spacer()
                        VStack {
                            Text(String(results[0].first_team_entry))
                                .font(.title.weight(.bold))
                            Text("Debut")
                        }
                        Spacer()
                    }.padding(.top)
                    VStack(alignment: .leading) {
                        Text("Statistics")
                            .font(.title3.weight(.bold))
                            .foregroundColor(Color.gray)
                            .padding()
                        VStack(alignment: .leading) {
                            Text("\(results[0].pole_positions)")
                                .font(.title3.weight(.bold))
                            Text("Pole Position")
                                .font(.headline.weight(.regular))
                                .foregroundColor(Color.gray)
                        }.padding(.leading)
                        VStack(alignment: .leading) {
                            Text("\(results[0].fastest_laps)")
                                .font(.title3.weight(.bold))
                            Text("Fastest Lap")
                                .font(.headline.weight(.regular))
                                .foregroundColor(Color.gray)
                        }.padding(.leading).padding(.top)
                        VStack(alignment: .leading) {
                            Text(results[0].chassis)
                                .font(.title3.weight(.bold))
                            Text("Chassis")
                                .font(.headline.weight(.regular))
                                .foregroundColor(Color.gray)
                        }.padding(.leading).padding(.top)
                        VStack(alignment: .leading) {
                            Text(results[0].engine)
                                .font(.title3.weight(.bold))
                            Text("Engine")
                                .font(.headline.weight(.regular))
                                .foregroundColor(Color.gray)
                        }.padding(.leading).padding(.top)
                        VStack(alignment: .leading) {
                            Text("\(results[0].highest_race_finish.position) (\(results[0].highest_race_finish.number) Race)")
                                .font(.title3.weight(.bold))
                            Text("Higest Rank")
                                .font(.headline.weight(.regular))
                                .foregroundColor(Color.gray)
                        }.padding(.leading).padding(.top)
                    }
                    
                    .navigationTitle(results[0].name)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(standing: 1, teamId: 1, points: 1)
    }
}
