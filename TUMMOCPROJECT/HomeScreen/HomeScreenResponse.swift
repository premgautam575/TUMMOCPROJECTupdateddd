//
//  HomeScreenResponse.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation
import CoreData


struct HomeScreenResponse : Codable  {
    
    var categories : [Categorydata]?
    
}

struct Categorydata : Codable {
    var id : Int?
    var name : String?
    var items : [ItemsData]?
    
}

struct ItemsData : Codable {
    var id : Int?
    var name : String?
    var icon : String?
    var price : Int?
    
}


