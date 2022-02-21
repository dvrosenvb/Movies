//
//  DetailProtocols.swift
//  Movies
//
//  Created by Rosendo Vázquez on 19/02/22.
//

import Foundation
import UIKit

//MARK: Router -
protocol PresenterToRouterProtocolDetail: AnyObject {
    static func createModule() -> DetailViewController
}

//MARK: Presenter -
protocol ViewToPresenterProtocolDetail: AnyObject {
    var view:PresenterToViewProtocolDetail? { get set }
    var interactor:PresenterToInteractorProtocolDetail? { get set }
    var router:PresenterToRouterProtocolDetail? {get set}
    
}

//MARK: Interactor -
protocol InteractorToPresenterProtocolDetail: AnyObject {
    
}

//MARK: View -
protocol PresenterToViewProtocolDetail: AnyObject {
    
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocolDetail:AnyObject{
    var presenter:InteractorToPresenterProtocolDetail? {get set}
    
}

