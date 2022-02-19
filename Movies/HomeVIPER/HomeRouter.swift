//
//  HomeRouter.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit

class HomeRouter: PresenterToRouterProtocolHome {
    static func createModule() -> HomeViewController {
        let view = HomeViewController(nibName: nil, bundle: nil)
        let presenter :ViewToPresenterProtocolHome & InteractorToPresenterProtocolHome = HomePresenter()
        let interactor : PresenterToInteractorProtocol = HomeInteractor()
        let router:PresenterToRouterProtocolHome = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view as? PresenterToViewProtocolHome
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    func routeToLogin(navigationController: UINavigationController) {
        let vc = LoginRouter.createModule()
        navigationController.pushViewController(vc, animated: true)
    }
    
     
}

