//
//  Flatmate.swift
//  FlatIt
//
//  Created by Euan Widjaja on 20/01/23.
//

import Foundation

struct Flatmate: Identifiable, Codable, Hashable {
    
    
    var id: Int
    var firstName: String
    var lastName: String
    var age: Int
    var occupation: String
    var payday: Date
    
}

final class FlatmatesData: ObservableObject {
    @Published var flatmates: [Flatmate] = [
        Flatmate(
            id: 1,
            firstName: "Euan",
            lastName: "Widjaja",
            age: 22,
            occupation: "Software Engineer",
            payday: Date.now
        ),
        Flatmate(
            id: 2,
            firstName: "Alicia",
            lastName: "Wilcock",
            age: 23,
            occupation: "Cleaner",
            payday: Date.now
        )
    ]
}
