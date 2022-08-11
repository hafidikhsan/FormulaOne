//
//  AboutView.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 11/08/22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .top) {
                    Color.red.frame(height: 150)
                    VStack {
                        Spacer().frame(height: 80)
                        Image("HafidIkhsanA")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(Color.white, lineWidth: 3))
                        Text("Hafid ikhsan Arifin")
                            .font(.title2.weight(.bold))
                            .padding(.top)
                        Text("Dicoding Academy iOS Developer")
                            .font(.headline.weight(.regular))
                            .foregroundColor(Color.gray)
                            .padding(.bottom)
                    }
                }
                
                .navigationTitle("About Me")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
