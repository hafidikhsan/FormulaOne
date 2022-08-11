import SwiftUI

struct ContentView: View {
    
    @State var results = [Teams]()
    
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
                    loadData.endPoint = "rankings/teams?season=2022"
                    loadData.LoadDataNow{
                        (teams) in self.results = teams
                    }
                }
            }
        } else {
            NavigationView {
                ZStack(alignment: .top) {
                    Color.white.ignoresSafeArea()
                    Image("Hero")
                        .resizable()
                        .frame(height: 280)
                        .frame(maxWidth: .infinity)
                        .ignoresSafeArea()
                    ScrollView {
                        Spacer()
                            .frame(height: 100)
                        VStack(alignment: .leading) {
                            HStack {
                                Image("F1Logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                                    .padding()
                                Text("Team Standing")
                                    .font(.headline.weight(.semibold))
                            }
                            ForEach(results, id: \.team.id) { team in
                                NavigationLink(destination: TeamDetailView(standing: Int(team.position), teamId: Int(team.team.id), points: team.points)) {
                                    TeamsListRow(team: team).padding()
                                }
                                Divider()
                            }
                        }.background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(radius: 20, y: -40)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .toolbar {
                    NavigationLink(destination: AboutView()) {
                        Image("HafidIkhsanA")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding()
                            .overlay(Circle()
                                .stroke(Color.white, lineWidth: 3)
                                .padding())
                    }
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
