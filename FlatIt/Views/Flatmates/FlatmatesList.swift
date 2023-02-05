//
//  Flatmates.swift
//  FlatIt
//
//  Created by Euan Widjaja on 20/01/23.
//

import SwiftUI

struct FlatmatesList: View {
    
    @FetchRequest(fetchRequest: Flatmate.all()) private var flatmates

    var provider = FlatmatesProvider.shared
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(flatmates) { flatmate in
                        FlatmateRow(flatmate: flatmate)
                        Divider()
                    }
                    Spacer()
                }
            }
            .navigationTitle("Flatmates")
        }
    
    }
}

struct FlatmateList_Previews: PreviewProvider {
    static var previews: some View {
        let preview = FlatmatesProvider.shared
        FlatmatesList(provider: preview)
            .environment(\.managedObjectContext, preview.viewContext)
            .previewDisplayName("Flatmates with data")
            .onAppear {
                Flatmate.makePreview(count: 4, in: preview.viewContext)
            }
    }
}
