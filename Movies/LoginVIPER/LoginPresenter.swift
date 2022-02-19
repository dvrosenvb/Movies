//
//  LoginPresenter.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit

class LoginPresenter: ViewToPresenterProtocolLogin {
  

    var view:PresenterToViewProtocolLogin?
    var interactor: PresenterToInteractorProtocolLogin?
    var router: PresenterToRouterProtocolLogin?
    
    func tryLogin(user: String, passsword: String) {
        interactor?.sessionLogin(user: user, password: passsword)
    }
    
    func logout() {
        interactor?.sessionLogOut()
    }
    
    
    func launchHome(navigationController: UINavigationController) {
        router?.pushToHome(navigationController: navigationController)
    }
}

extension LoginPresenter:InteractorToPresenterProtocolLogin{
    func loginSucceded(info:String) {
        view?.loginSucceded(info: info)
    }
    
    func loginFailed(info:String) {
        view?.loginFailed(info: info)
    }
     
}


