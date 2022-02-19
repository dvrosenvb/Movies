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

    override func viewDidLoad() {
        super.viewDidLoad()
        installView()
        
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
        
        // Create the actions.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
        }
        
        let destructiveAction = UIAlertAction(title: viewProfileTitle, style: .default) { _ in
            let vc = Profile()
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true, completion: nil)
        }
        
        let destructiveAction1 = UIAlertAction(title: destructiveButtonTitle, style: .destructive) { _ in
            guard let nc = self.navigationController else { return }
            self.title = " "
            self.presenter?.rToLogin(navigationController: nc)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(destructiveAction)
        alertController.addAction(destructiveAction1)
       
        present(alertController, animated: true, completion: nil)
    }
    
    
     
}

class Profile: UIViewController {
    
    //MARK: VIPER Elements
    //MARK: UIElements
    lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.text = UIManager.titleProfile
        label.font = UIManager.RegularFont(20)
        label.textColor = UIManager.BASIC_WHITE
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lblName: UILabel = {
        let label = UILabel()
        label.text = UIManager.userRealName
        label.font = UIManager.RegularFont(24)
        label.textColor = UIManager.BASIC_WHITE
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lblUser: UILabel = {
        let label = UILabel()
        label.text = Constants.USER_EMAIL
        label.font = UIManager.RegularFont(14)
        label.textColor = UIManager.BASIC_WHITE
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lblFavMovies: UILabel = {
        let label = UILabel()
        label.text = UIManager.txtMovieFavTitle
        label.font = UIManager.RegularFont(20)
        label.textColor = UIManager.BASIC_WHITE
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var ivAvatar: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = UIManager.avatarCurve
        iv.image = UIImage(named: "avatar")
        return iv
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIManager.DARK
        installView()
    }
    
    //MARK: Functions
    func installView(){
        view.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(ivAvatar)
        ivAvatar.backgroundColor = .white
        ivAvatar.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(120)
        }
        
        view.addSubview(lblName)
        lblName.snp.makeConstraints { make in
            make.top.equalTo(ivAvatar.snp.bottom).offset(-60)
            make.leading.equalTo(ivAvatar.snp.trailing).offset(20)
        }
        
        view.addSubview(lblUser)
        lblUser.snp.makeConstraints { make in
            make.top.equalTo(lblName.snp.bottom).offset(10)
            make.leading.equalTo(ivAvatar.snp.trailing).offset(20)
        }
        
        view.addSubview(lblFavMovies)
        lblFavMovies.snp.makeConstraints { make in
            make.top.equalTo(ivAvatar.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }
        
    }
    
    
    
    
    
    //MARK: Actions
    
}
