//
//  HomeProtocols.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import Foundation
import UIKit
//MARK: Router -
protocol PresenterToRouterProtocolHome: AnyObject {
    static func createModule() -> HomeViewController
    func routeToLogin(navigationController:UINavigationController)
}

//MARK: Presenter -
protocol ViewToPresenterProtocolHome: AnyObject {
    var view:PresenterToViewProtocolHome? { get set }
    var interactor:PresenterToInteractorProtocol? { get set }
    var router:PresenterToRouterProtocolHome? {get set}
     
    func rToLogin(navigationController:UINavigationController)
    
}

//MARK: Interactor -
protocol InteractorToPresenterProtocolHome: AnyObject {
    
}

//MARK: View -
protocol PresenterToViewProtocolHome: AnyObject {
    
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocol:AnyObject{
    var presenter:InteractorToPresenterProtocolHome? {get set}
     
}

