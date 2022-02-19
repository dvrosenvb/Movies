//
//  LoginRouter.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit

class LoginRouter: PresenterToRouterProtocolLogin {
   
    
    
    weak var viewController:LoginViewController?
    
    static func createModule() -> LoginViewController {
        let view = LoginViewController(nibName: nil, bundle: nil)
        let presenter :ViewToPresenterProtocolLogin & InteractorToPresenterProtocolLogin = LoginPresenter()
        let interactor : PresenterToInteractorProtocolLogin = LoginInteractor()
        let router:PresenterToRouterProtocolLogin = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view as? PresenterToViewProtocolLogin
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    func pushToInfoDetail(navigationController: UINavigationController) {
        let canva = LoginRouter.createModule()
        navigationController.pushViewController(canva, animated: true)
    }
    
    func pushToHome(navigationController: UINavigationController) {
        let vc = HomeRouter.createModule()
        navigationController.pushViewController(vc, animated: true)
    }
   
}

