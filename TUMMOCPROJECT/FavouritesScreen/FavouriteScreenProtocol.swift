//
//  FavouriteScreenProtocol.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation



protocol FavouriteScreenWireframeProtocol: class {
    func routeToCartScreen()
}

protocol FavouriteScreenPresenterProtocol: class {
    
    var interactor: FavouriteScreenInteractorInputProtocol? { get set }
    func displayfavouriteitems()
}

protocol FavouriteScreenInteractorOutputProtocol: class {
   
   func interactorHomeScreenSuccess(messageStr: String, HomeScreenSuccess: [String:Any])
   
}


protocol FavouriteScreenInteractorInputProtocol: class {
    
    var presenter: FavouriteScreenInteractorOutputProtocol?  { get set }
    func fetchfavouriteitems()
}


protocol FavouriteScreenViewProtocol: class {
    
    var presenter: FavouriteScreenPresenterProtocol?  { get set }
    func viewHomeScreenSuccess(message: String,HomeScreenSuccess:[String:Any])
}
