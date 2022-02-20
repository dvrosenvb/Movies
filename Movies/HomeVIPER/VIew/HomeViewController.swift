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
        installTable()
        
    }
    
    override func viewDidLayoutSubviews() {
       
    }
    
    func installTable()  {
        tableView = UITableView()
        tableView?.frame = view.bounds
        tableView?.backgroundColor = UIManager.BLUE_MAIN
        guard let vt = tableView else { return }
        reusableTableView = ComponentDataSource(vt, view.frame.size.width, view.frame.size.height)
        reusableTableView.delegate = self
        view.addSubview(reusableTableView.tableView)
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
            guard let nc = self.navigationController else { return }
            Constants.UI_TYPE = .Profile
            self.presenter?.rToProfile(navigationController: nc)
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
        presenter?.rToProfile(navigationController: nc)
    }
    
    
}
