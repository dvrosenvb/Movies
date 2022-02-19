//
//  LoginProtocols.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//


import Foundation
import UIKit

//MARK: Router -
protocol PresenterToRouterProtocolLogin: AnyObject {
    static func createModule() -> LoginViewController
    func pushToInfoDetail(navigationController:UINavigationController)
    func pushToHome(navigationController: UINavigationController)
    
}

//MARK: Presenter -
protocol ViewToPresenterProtocolLogin: AnyObject {
    var view:PresenterToViewProtocolLogin? { get set }
    var interactor:PresenterToInteractorProtocolLogin? { get set }
    var router:PresenterToRouterProtocolLogin? {get set}
    
    func launchHome(navigationController: UINavigationController)
     
}

//MARK: Interactor -
protocol InteractorToPresenterProtocolLogin: AnyObject {
   
}

//MARK: View -
protocol PresenterToViewProtocolLogin: AnyObject {
     
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocolLogin:AnyObject{
    var presenter:InteractorToPresenterProtocolLogin? {get set}
    
}

