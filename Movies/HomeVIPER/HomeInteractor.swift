//
//  HomeInteractor.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit

class HomeInteractor:PresenterToInteractorProtocol {
    let networkService: NetworkService
    var presenter: InteractorToPresenterProtocolHome?
    var movies:[Movie]?
    
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchInfoAllMovies() {
        let request = MovieRequest()
        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                guard let moviesFetched = self?.movies else { return }
                self?.presenter?.infoAllMoviesFetched(movies: moviesFetched)
              //TODO: Succes
            case .failure(let error):
                print(error)
                //TODO: Failure
            }
        }
    }
    
    func fetchInfoSingleMovie() {
        
    }
    
    func loadProfileInformation() {
        
    }
    
}

