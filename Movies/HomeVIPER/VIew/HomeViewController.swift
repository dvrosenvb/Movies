//
//  HomeViewController.swift
//  Movies
//
//  Created by Rosendo Vázquez on 18/02/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var presenter : ViewToPresenterProtocolHome?
    var tableView: UITableView?
    var reusableTableView : ComponentDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installView()
        presenter?.fetchAllMovies()
    }
    
    override func viewDidLayoutSubviews() {
       
    }
    
    func installTable(model:[CollectionTableViewCellModel])  {
        
        DispatchQueue.main.async {
            self.tableView = UITableView()
            self.tableView?.frame = self.view.bounds
            self.tableView?.backgroundColor = UIManager.BLUE_BG_MAIN
            guard let vt = self.tableView else { return }
            self.reusableTableView = ComponentDataSource(vt, self.view.frame.size.width, self.view.frame.size.height, model)
            self.reusableTableView.delegate = self
            self.view.addSubview(self.reusableTableView.tableView)
        }
    }
    
    func installView(){
        UIManager.customizeBar(vc: self, vcTitle: "Movies", leftBtnHidden: true)
        view.backgroundColor = UIManager.BLUE_MAIN
        
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self,                                           action: #selector(onSearchButtonClicked))
        searchBarButtonItem.tintColor = UIManager.BASIC_WHITE
        self.navigationItem.rightBarButtonItem  = searchBarButtonItem   
    }
    
    @objc func onSearchButtonClicked(_ sender: Any){
        showContextualMenu()
    }
    
    
    func showContextualMenu() {
        let message = NSLocalizedString(UIManager.txtMsgLogout, comment: "")
        let cancelButtonTitle = NSLocalizedString(UIManager.txtMsgCancel, comment: "")
        let destructiveButtonTitle = NSLocalizedString(UIManager.txtLogout, comment: "")
        let viewProfileTitle = NSLocalizedString(UIManager.txtViewProfile, comment: "")
        
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
        }
        
        let destructiveAction = UIAlertAction(title: viewProfileTitle, style: .default) { _ in
            let modelEmpty = ItemCollectionViewCellModel(id: 0, original_title: "", image: "", overview: "", release_date: "", vote_average: 0, vote_count: 0)
            guard let nc = self.navigationController else { return }
            Constants.UI_TYPE = .Profile
            self.presenter?.rToProfile(navigationController: nc, modelEmpty)
            
        }
        
        let destructiveAction1 = UIAlertAction(title: destructiveButtonTitle, style: .destructive) { _ in
            guard let nc = self.navigationController else { return }
            self.title = " "
            Constants.UI_TYPE = .NoDefined
            self.presenter?.rToLogin(navigationController: nc)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(destructiveAction)
        alertController.addAction(destructiveAction1)
       
        present(alertController, animated: true, completion: nil)
    }
    
}

extension HomeViewController:ComponentDataSourceProtocol{
    func elementTapped(model: ItemCollectionViewCellModel) {
        guard let nc = self.navigationController else { return }
        Constants.UI_TYPE = .MovieInfo
        presenter?.rToProfile(navigationController: nc, model)
        
    }
}

extension HomeViewController:PresenterToViewProtocolHome{
    func loadCollection(movies: [Movie]) {
        var item:[ItemCollectionViewCellModel] = []
        var collection:[CollectionTableViewCellModel] = []
        var row = 1
        for movie in movies {
            item.append(ItemCollectionViewCellModel.init(id: movie.id, original_title: movie.title, image: movie.posterURL, overview: movie.overview,
                                                         release_date: movie.releaseDate, vote_average: Double(movie.voteAverage), vote_count: movie.voteCount))
            if ((row % 5) == 0) {
                collection.append(CollectionTableViewCellModel(data: item))
                item.removeAll()
            }
            
            row = row + 1
        }
                
        installTable(model: collection)
        
    }
    
    func showErrorAllMovies() {
        print("Some error happens [ALL]")
    }
    
    func showErrorSingleMovie() {
        print("Some error happens [SINGLE MOVIE]")
    }
    
    
}
