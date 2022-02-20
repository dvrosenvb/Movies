//
//  DetailViewController.swift
//  Movies
//
//  Created by Rosendo Vázquez on 19/02/22.
//

import Foundation
import UIKit
import SnapKit

public enum ViewType {
    case Profile
    case MovieInfo
    case NoDefined
}

class DetailViewController: UIViewController {
    
    //MARK: Vars
    var tableView: UITableView?
    var reusableTableView : ComponentDataSource!
    var uiType:ViewType = .NoDefined
    
    //MARK: VIPER Elements
    var presenter : ViewToPresenterProtocolDetail?
   
    //MARK: UIElements
    lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.text = (uiType == .Profile) ? UIManager.titleProfile :
                     ((uiType == .MovieInfo) ? UIManager.titleMovieInfo : UIManager.titleInfo)
        
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
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIManager.GREEN.cgColor
        iv.image = UIManager.getImageFromUrl(url: "https://scontent.fmex36-1.fna.fbcdn.net/v/t39.30808-6/273123399_2405028076295152_6166771893846864269_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeFQUR5Kimaoh8kyYdvmc-qx9VWo6-pe5Zf1Vajr6l7ll0oGKSJfY6HBrr5eY6T9xixryPEsI6zXGpUUXZqfdlg3&_nc_ohc=7twVfdTrkekAX-wT0iw&_nc_ht=scontent.fmex36-1.fna&oh=00_AT899G5uzKnIe6wL8KeFqHqC_4nkAim7UbuTUN4olmu1qQ&oe=621743E4") //UIImage(named: "avatar")
        return iv
    }()
    
    lazy var viewFavorites: UIView = {
        let view = UIView()
        view.backgroundColor = UIManager.BLUE_BG_MAIN
        return view
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIManager.BLUE_BG_MAIN
        uiType = Constants.UI_TYPE
        installTable()
        installView()
    }
    
    //MARK: Functions
    func installTable()  {
        tableView = UITableView()
        tableView?.frame.origin.x = 0
        tableView?.frame.origin.y = 0
        tableView?.frame.size.width = view.frame.width
        tableView?.frame.size.height = view.frame.width / 0.7
        tableView?.backgroundColor = UIManager.BLUE_BG_MAIN
        guard let vt = tableView else { return }
        reusableTableView = ComponentDataSource(vt, 414, 414) //TODO: Send Model Fetched
        reusableTableView.tableView.backgroundColor = UIManager.BLUE_BG_MAIN
        viewFavorites.addSubview(reusableTableView.tableView)
    }
    
    func installView()  {
        
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
        
        view.addSubview(viewFavorites)
        viewFavorites.snp.makeConstraints { make in
            make.top.equalTo(lblFavMovies.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }

    //MARK: Actions
    
}


