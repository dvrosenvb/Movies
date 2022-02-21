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
    func routeToProfile(navigationController:UINavigationController, _ model:ItemCollectionViewCellModel)
}

//MARK: Presenter -
protocol ViewToPresenterProtocolHome: AnyObject {
    var view:PresenterToViewProtocolHome? { get set }
    var interactor:PresenterToInteractorProtocol? { get set }
    var router:PresenterToRouterProtocolHome? {get set}
     
    func rToLogin(navigationController:UINavigationController)
    func rToProfile(navigationController:UINavigationController,_ model: ItemCollectionViewCellModel?)
    func fetchAllMovies()
    func fetchInfoMovie(idMovie:Int)
    func loadProfileInfo()
}

//MARK: Interactor -
protocol InteractorToPresenterProtocolHome: AnyObject {
    func infoAllMoviesFetched(movies:[Movie])
    func infoSingleMovieFetched()
    func infoFetchInformationAllMoviesFailed()
    func infoFetchInformationSigleMovieFailed()
}

//MARK: View -
protocol PresenterToViewProtocolHome: AnyObject {
    func loadCollection(movies:[Movie])
    func showErrorAllMovies()
    func showErrorSingleMovie()
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocol:AnyObject{
    var presenter:InteractorToPresenterProtocolHome? {get set}
    func fetchInfoAllMovies()
    func fetchInfoSingleMovie()
    func loadProfileInformation()
}

