//
//  Flatmate.swift
//  FlatIt
//
//  Created by Euan Widjaja on 20/01/23.
//

import Foundation
import CoreData

final class Flatmate: NSManagedObject, Identifiable {
    

    @NSManaged var id: Int
    @NSManaged var name: String
    @NSManaged var age: Int
//    var occupation: String
//    var payday: Date
    
}

final class FlatmatesData: ObservableObject {
    @Published var flatmates: [Flatmate] = [
//        Flatmate(
//            id: 1,
//            name: "Euan Widjaja",
//            age: 22
//        ),
//        Flatmate(
//            id: 2,
//            name: "Evan Wodjaja",
//            age: 23
//        )
    ]
}
