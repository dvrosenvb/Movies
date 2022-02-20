//
//  DetailPresenter.swift
//  Movies
//
//  Created by Rosendo Vázquez on 19/02/22.
//

import UIKit

class DetailPresenter: ViewToPresenterProtocolDetail {
    
    var view:PresenterToViewProtocolDetail?
    var interactor: PresenterToInteractorProtocolDetail?
    var router: PresenterToRouterProtocolDetail?
    
}

extension DetailPresenter:InteractorToPresenterProtocolDetail{
     
}


