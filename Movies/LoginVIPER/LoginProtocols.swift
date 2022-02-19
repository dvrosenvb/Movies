//
//  LoginProtocols.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import Foundation
import UIKit

//MARK: Router - PresenterToRouter
protocol PresenterToRouterProtocolLogin: AnyObject {
    static func createModule() -> LoginViewController
    func pushToInfoDetail(navigationController:UINavigationController)
    func pushToHome(navigationController: UINavigationController)
}

//MARK: Presenter - ViewToPresenter
protocol ViewToPresenterProtocolLogin: AnyObject {
    var view:PresenterToViewProtocolLogin? { get set }
    var interactor:PresenterToInteractorProtocolLogin? { get set }
    var router:PresenterToRouterProtocolLogin? {get set}
    
    func launchHome(navigationController: UINavigationController)
    func tryLogin(user:String, passsword:String)
    func logout()
}

//MARK: Interactor - InteractorToPresenter
protocol InteractorToPresenterProtocolLogin: AnyObject {
    func loginSucceded(info:String)
    func loginFailed(info:String)
}

//MARK: View - PresenterToView
protocol PresenterToViewProtocolLogin: AnyObject {
    func loginSucceded(info:String)
    func loginFailed(info:String)
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocolLogin:AnyObject{
    var presenter:InteractorToPresenterProtocolLogin? {get set}
    func sessionLogin(user:String,password:String)
    func sessionLogOut()
}

