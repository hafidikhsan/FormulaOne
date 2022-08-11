//
//  ErrorView.swift
//  FormulaOne
//
//  Created by Hafid Ikhsan Arifin on 11/08/22.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Something Went Wrong")
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
