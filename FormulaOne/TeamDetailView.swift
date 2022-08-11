//
//  TeamDetailView.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 10/08/22.
//

import SwiftUI

struct TeamDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .top) {
                    Color.red.frame(height: 150)
                    VStack {
                        Spacer().frame(height: 80)
                        Image("HafidIkhsanA")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(Color.white, lineWidth: 5)
                                )
                            .shadow(radius: 10)
                        Text("Oracle Red Bull Racing")
                            .font(.title2.weight(.bold))
                            .padding(.top)
                        Text("Milton Keynes, United Kingdom")
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
                        Text("450")
                            .font(.title.weight(.bold))
                        Text("Points")
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    VStack {
                        Text("1")
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
                        Text("Helmut Marko")
                            .font(.title3.weight(.bold))
                        Text("President")
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color.gray)
                    }.padding(.leading)
                    VStack(alignment: .leading) {
                        Text("Christian Horner")
                            .font(.title3.weight(.bold))
                        Text("Team Principal")
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color.gray)
                    }.padding(.leading).padding(.top)
                    VStack(alignment: .leading) {
                        Text("Adrian Newie")
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
                            Text("12")
                                .font(.title.weight(.bold))
                        }
                        Text("World Champions")
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    VStack {
                        Text("1997")
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
                        Text("1")
                            .font(.title3.weight(.bold))
                        Text("Pole Position")
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color.gray)
                    }.padding(.leading)
                    VStack(alignment: .leading) {
                        Text("87")
                            .font(.title3.weight(.bold))
                        Text("Fastest Lap")
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color.gray)
                    }.padding(.leading).padding(.top)
                    VStack(alignment: .leading) {
                        Text("RB18")
                            .font(.title3.weight(.bold))
                        Text("Chassis")
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color.gray)
                    }.padding(.leading).padding(.top)
                    VStack(alignment: .leading) {
                        Text("Red Bull Powertrains")
                            .font(.title3.weight(.bold))
                        Text("Engine")
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color.gray)
                    }.padding(.leading).padding(.top)
                    VStack(alignment: .leading) {
                        Text("1 (84 Race)")
                            .font(.title3.weight(.bold))
                        Text("Higest Rabk")
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color.gray)
                    }.padding(.leading).padding(.top)
                }
            }
                .navigationTitle("Detail")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView()
    }
}
