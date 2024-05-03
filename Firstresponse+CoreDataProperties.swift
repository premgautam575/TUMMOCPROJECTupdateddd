//
//  Firstresponse+CoreDataProperties.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 06/05/24.
//
//

import Foundation
import CoreData
import UIKit


extension Firstresponse  {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Firstresponse> {
        return NSFetchRequest<Firstresponse>(entityName: "Firstresponse")
    }


    @NSManaged public var name: String
    @NSManaged public var price: String
    @NSManaged public var icon: String
  

}

extension Firstresponse : Identifiable {

}

