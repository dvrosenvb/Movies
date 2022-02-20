//
//  HomePresenter.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit

class HomePresenter: ViewToPresenterProtocolHome {

    var view:PresenterToViewProtocolHome?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocolHome?
    
    
    func rToLogin(navigationController:UINavigationController) {
        router?.routeToLogin(navigationController: navigationController)
    }
    func rToProfile(navigationController: UINavigationController) {
        router?.routeToProfile(navigationController: navigationController)
    }
    
}

extension HomePresenter:InteractorToPresenterProtocolHome{
    
}


