//
//  HomeScreenInteractor.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation
import UIKit
import CoreData

protocol HomeScreenInteractorInputProtocol: class {
    
    var presenter: HomeScreenInteractorOutputProtocol? {get set}
    
    func interactorHomeScreen()
}

class HomeScreenInteractor: HomeScreenInteractorInputProtocol {
    
    weak var presenter: HomeScreenInteractorOutputProtocol?
    
    func interactorHomeScreen()  {
        
        var catergorydata : [Categorydata] = []
        
        let url = Bundle.main.url(forResource: "shopping", withExtension: "json")
        
        print("third screen")
        
        let data = try? Data(contentsOf: url!, options: .alwaysMapped)
        
        let jsondata = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any] ?? [:]
        
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let newNote1 = Firstresponse(context: context)
        
        presenter?.interactorHomeScreenSuccess(messageStr: "", HomeScreenSuccess: jsondata!)
        
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()

    }
}
