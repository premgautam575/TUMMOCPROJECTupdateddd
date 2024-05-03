//
//  CoredataProvider.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 06/05/24.
//

import CoreData
import UIKit

class NewsPostsProvider {
    private(set) var managedObjectContext: NSManagedObjectContext
    private weak var fetchedResultsControllerDelegate: NSFetchedResultsControllerDelegate?

    init(with managedObjectContext: NSManagedObjectContext,
         fetchedResultsControllerDelegate: NSFetchedResultsControllerDelegate?)
    {
        self.managedObjectContext = managedObjectContext
        self.fetchedResultsControllerDelegate = fetchedResultsControllerDelegate
    }

    /**
     A fetched results controller for the NewsPosts entity, sorted by date.
     */
    lazy var fetchedResultsController: NSFetchedResultsController<Firstresponse> = {
        let fetchRequest: NSFetchRequest<Firstresponse> = Firstresponse.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Firstresponse.name), ascending: false)]

        let controller = NSFetchedResultsController(
            fetchRequest: fetchRequest, managedObjectContext: managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        controller.delegate = fetchedResultsControllerDelegate

        do {
            try controller.performFetch()
            
        } catch {
            print("Fetch failed")
        }

        return controller
    }()
}
