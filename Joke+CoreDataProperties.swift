//
//  Joke+CoreDataProperties.swift
//  DadJokes
//
//  Created by dtthong on 27/07/2022.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var emoji: String

}

extension Joke : Identifiable {

}
