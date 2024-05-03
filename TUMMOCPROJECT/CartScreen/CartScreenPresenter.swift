//
//  CartScreenPresenter.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation

import UIKit

class CartScreenPresenter: CartScreenPresenterProtocol, CartScreenInteractorOutputProtocol {
    func interactorHomeScreenSuccess(messageStr: String, HomeScreenSuccess: [String : Any]) {
        view?.viewHomeScreenSuccess(message: messageStr, HomeScreenSuccess: HomeScreenSuccess)
    }
    
    
    func displayCartitems() {
        interactor?.fetchCartitems()
    }
    
   
    func presentingToCartScreen(input:Int,input1:Int) {
        
    }
 
    weak private var view: CartScreenViewProtocol?
    var interactor:CartScreenInteractorInputProtocol?
    private let router: CartScreenWireframeProtocol

    init(interface: CartScreenViewProtocol, interactor: CartScreenInteractorInputProtocol?, router: CartScreenWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
