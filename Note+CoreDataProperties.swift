//
//  Note+CoreDataProperties.swift
//  Notes
//
//  Created by Avinash Kumar on 22/09/20.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        let request =  NSFetchRequest<Note>(entityName: "Note")
        request.sortDescriptors =  [NSSortDescriptor(keyPath: \Note.priority, ascending: false)]
        return request
    }

    @NSManaged public var title: String
    @NSManaged public var caption: String
    @NSManaged public var createdAt: Date
    @NSManaged public var priority: Int64
    

}

