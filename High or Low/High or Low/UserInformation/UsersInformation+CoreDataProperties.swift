//
//  UsersInformation+CoreDataProperties.swift
//  High or Low
//
//  Created by Kin+Carta on 13.2.24.
//
//

import Foundation
import CoreData


extension UsersInformation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsersInformation> {
        return NSFetchRequest<UsersInformation>(entityName: "UsersInformation")
    }

    @NSManaged public var betsLost: Int32
    @NSManaged public var betsPlaced: Int32
    @NSManaged public var betsWon: Int32
    @NSManaged public var moneyAmount: Double
    @NSManaged public var moneyMadeLost: Double
    @NSManaged public var profit: Bool
    @NSManaged public var username: String?

}

extension UsersInformation : Identifiable {

}
