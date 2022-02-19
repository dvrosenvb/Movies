//
//  LoginPresenter.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit

class LoginPresenter: ViewToPresenterProtocolLogin {
    func launchHome(navigationController: UINavigationController) {
        router?.pushToHome(navigationController: navigationController)
    }
        
    var view:PresenterToViewProtocolLogin?
    var interactor: PresenterToInteractorProtocolLogin?
    var router: PresenterToRouterProtocolLogin?
    
    func startFetchingCHaracter(idCharacter: Int) {
        
    }
    
    func showCharacterProfile(navigationController: UINavigationController) {
        router?.pushToInfoDetail(navigationController: navigationController)
    }
    
}

extension LoginPresenter:InteractorToPresenterProtocolLogin{
    
    
    func infoCharFetchedFailed() {}
    
    
    
}


