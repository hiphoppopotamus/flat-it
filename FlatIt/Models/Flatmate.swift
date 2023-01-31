//
//  Flatmate.swift
//  FlatIt
//
//  Created by Euan Widjaja on 20/01/23.
//

import Foundation
import CoreData

final class Flatmate: NSManagedObject, Identifiable {

    @NSManaged var name: String
    @NSManaged var dateOfBirth: Date
//    var occupation: String
//    var payday: Date
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        setPrimitiveValue(Date.now, forKey: "dateOfBirth")
    }
}


extension Flatmate {
    
    private static var flatmateFetchRequest: NSFetchRequest<Flatmate> {
        NSFetchRequest(entityName: "Flatmate")
    }
    
    static func all() -> NSFetchRequest<Flatmate> {
        
        let request: NSFetchRequest<Flatmate> = flatmateFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Flatmate.name, ascending: true)
        ]
        
        return request
    }
    
}


extension Flatmate {
    
    @discardableResult
    static func makePreview(count: Int, in context: NSManagedObjectContext) -> [Flatmate] {
        
        var flatmates = [Flatmate]()
        for i in 0 ..< count {
            let flatmate = Flatmate(context: context)
            flatmate.name = "Flatmate \(i)"
            flatmate.dateOfBirth = Calendar.current.date(byAdding: .day, value: -i, to: .now) ?? .now
            flatmates.append(flatmate)
        }
        
        return flatmates
    }
    
    static func previewFlatmate(context: NSManagedObjectContext = FlatmatesProvider.shared.viewContext) -> Flatmate {
        return makePreview(count: 1, in: context)[0]
    }
    
    static func empty(context: NSManagedObjectContext = FlatmatesProvider.shared.viewContext) -> Flatmate {
        return Flatmate(context: context)
    }
}

