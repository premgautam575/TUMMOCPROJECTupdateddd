//
//  CartScreenProtocol.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation


protocol CartScreenWireframeProtocol: class {
    func routeToCartScreen()
}

protocol CartScreenPresenterProtocol: class {
    
    var interactor: CartScreenInteractorInputProtocol? { get set }
    func displayCartitems()
}

protocol CartScreenInteractorOutputProtocol: class {
   
   func interactorHomeScreenSuccess(messageStr: String, HomeScreenSuccess: [String:Any])
   
}


protocol CartScreenInteractorInputProtocol: class {
    
    var presenter: CartScreenInteractorOutputProtocol?  { get set }
    func fetchCartitems()
}


protocol CartScreenViewProtocol: class {
    
    var presenter: CartScreenPresenterProtocol?  { get set }
    func viewHomeScreenSuccess(message: String,HomeScreenSuccess:[String:Any])
}
