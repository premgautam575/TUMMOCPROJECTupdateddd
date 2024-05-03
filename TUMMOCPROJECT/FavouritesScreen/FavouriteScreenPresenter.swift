//
//  FavouriteScreenPresenter.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation


import UIKit

class FavouriteScreenPresenter: FavouriteScreenPresenterProtocol, FavouriteScreenInteractorOutputProtocol {
    func interactorHomeScreenSuccess(messageStr: String, HomeScreenSuccess: [String : Any]) {
        view?.viewHomeScreenSuccess(message: messageStr, HomeScreenSuccess: HomeScreenSuccess)
    }
    
    
    func displayfavouriteitems() {
        interactor?.fetchfavouriteitems()
    }
    
   
    func presentingToFavouriteScreen(input:Int,input1:Int) {
        
    }
 
    weak private var view: FavouriteScreenViewProtocol?
    var interactor: FavouriteScreenInteractorInputProtocol?
    private let router: FavouriteScreenWireframeProtocol

    init(interface: FavouriteScreenViewProtocol, interactor: FavouriteScreenInteractorInputProtocol?, router: FavouriteScreenWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
