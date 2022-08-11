import SwiftUI

struct TeamsListRow: View {
    let team: Teams
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: team.team.logo)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading) {
                Text(team.team.name)
                    .font(.title3.weight(.bold))
                    .lineLimit(1)
                    .foregroundColor(Color.black)
                Spacer()
                    .frame(height: 10)
                Text("\(team.points) Points")
                    .font(.body.weight(.regular))
                    .lineLimit(2)
                    .foregroundColor(Color.black)
            }.padding(.leading, 10)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .font(.system(size: 25.0))
                .opacity(0.3)
        }
    }
}

struct TeamsListRow_Previews: PreviewProvider {
    
    static var previews: some View {
        let dummyData = Teams(position: 1, points: 250, season: 2022, team: Team(id: 10, name: "Oracle Red Bull Racing", logo: "https://media.api-sports.io/formula-1/teams/1.png"))
        
        TeamsListRow(team: dummyData)
    }
}
