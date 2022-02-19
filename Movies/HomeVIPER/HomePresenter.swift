//
//  HomePresenter.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit

class HomePresenter: ViewToPresenterProtocolHome {
    func rToLogin(navigationController:UINavigationController) {
        router?.routeToLogin(navigationController: navigationController)
    }
    
    
    var view:PresenterToViewProtocolHome?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocolHome?
    
}

extension HomePresenter:InteractorToPresenterProtocolHome{
    
}


