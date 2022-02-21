//
//  DetailRouter.swift
//  Movies
//
//  Created by Rosendo Vázquez on 19/02/22.
//


import UIKit

class DetailRouter: PresenterToRouterProtocolDetail {
    static func createModule() -> DetailViewController {
        let view = DetailViewController(nibName: nil, bundle: nil)
        let presenter :ViewToPresenterProtocolDetail & InteractorToPresenterProtocolDetail = DetailPresenter()
        let interactor : PresenterToInteractorProtocolDetail = DetailInteractor()
        let router:PresenterToRouterProtocolDetail = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view as PresenterToViewProtocolDetail
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
     
}

