//
//  Flatmates.swift
//  FlatIt
//
//  Created by Euan Widjaja on 20/01/23.
//

import SwiftUI

struct FlatmatesList: View {
    @EnvironmentObject var flatmatesData: FlatmatesData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(flatmatesData.flatmates) { flatmate in
                        FlatmateRow(flatmate: flatmate)
                        Divider()
                    }
                    Spacer()
                }
            }
            .navigationTitle("Fl")
        }
    
    }
}

struct Flatmates_Previews: PreviewProvider {
    static var previews: some View {
        FlatmatesList()
            .environmentObject(FlatmatesData())
    }
}
