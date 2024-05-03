//
//  CartScreenRouter.swift
//  TUMMOCPROJECT
//
//  Created by prem  on 03/05/24.
//

import Foundation
import UIKit

class CartScreenRouter: CartScreenWireframeProtocol {
    
    func routeToCartScreen() {
        print("")
    }
    
 
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        
        // Change to get view from storyboard if not using progammatic UI
        let view = CartScreenViewController(nibName: nil, bundle: nil)
        let interactor = CartScreenInteractor()
        let router = CartScreenRouter()
        let presenter = CartScreenPresenter(interface: view as! CartScreenViewProtocol , interactor: interactor, router: router)


        view.presenter = presenter as?CartScreenPresenterProtocol
        interactor.presenter = presenter as? CartScreenInteractorOutputProtocol
        presenter.interactor = interactor as? CartScreenInteractorInputProtocol
        
        router.viewController = view
        return view
    }
}
