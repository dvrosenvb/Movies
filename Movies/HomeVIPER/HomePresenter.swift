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
    
    func rToProfile(navigationController: UINavigationController, _ model: ItemCollectionViewCellModel?) {
        guard let modelMovie = model else { return }
        router?.routeToProfile(navigationController: navigationController, modelMovie)
    }
    
    func fetchAllMovies() {
        interactor?.fetchInfoAllMovies()
    }
    
    func fetchInfoMovie(idMovie: Int) {
        
    }
    
    func loadProfileInfo() {
        
    }
    
}

extension HomePresenter:InteractorToPresenterProtocolHome{
    func infoAllMoviesFetched(movies:[Movie]) {
        view?.loadCollection(movies: movies)
    }
    
    func infoSingleMovieFetched() {
        
    }
    
    func infoFetchInformationAllMoviesFailed() {
        
    }
    
    func infoFetchInformationSigleMovieFailed() {
        
    }
    
    
}


