//
//  DetailViewController.swift
//  Movies
//
//  Created by Rosendo Vázquez on 19/02/22.
//

import Foundation
import UIKit
import SnapKit
import CoreData

public enum ViewType {
    case Profile
    case MovieInfo
    case NoDefined
}

open class DetailViewController: UIViewController {
    
    //MARK: Vars
    var tableView: UITableView?
    var reusableTableView : ComponentDataSource!
    var uiType:ViewType = .NoDefined
    var isFavorite:Bool = false
    //MARK: Model to save
    var idLocal:Int = 0
    var original_titleLocal:String = ""
    var imageLocal:String = ""
    var overviewLocal:String = ""
    var release_dateLocal:String = ""
    var vote_averageLocal:Double = 0
    var vote_countLocal:Int = 0
    
    
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
        iv.image = UIImage(named: "avatar")
        return iv
    }()
    
    lazy var lblOverview : UILabel = {
        let label = UILabel()
        label.font = UIManager.RegularFont(12)
        label.numberOfLines = 0
        label.setMargins()
        label.textColor = UIManager.BLUE_SECONDARY
        label.text = " "
        return label
    }()
    
    lazy var lblMovieTitle : UILabel = {
        let label = UILabel()
        label.font = UIManager.RegularFont(18)
        label.numberOfLines = 0
        label.setMargins()
        label.textColor = UIManager.BASIC_WHITE
        label.text = " "
        return label
    }()
    
    lazy var viewFavorites: UIView = {
        let view = UIView()
        view.backgroundColor = UIManager.BLUE_BG_MAIN
        return view
    }()
     
    lazy var viewMovieTop = UIView()
    lazy var stackInfoMovie: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.frame.size.width = view.frame.width
        return sv
    }()
    
    lazy var viewMovieContainer = UIView()
    lazy var viewGradient : UIView = {
        let view = UIView()
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 0).cgColor
        let colorBottom = UIManager.BLUE_BG_MAIN.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 0.96]
        gradientLayer.frame.origin.x = 0
        gradientLayer.frame.origin.y = 0
        gradientLayer.frame.size.width = self.view.frame.width
        gradientLayer.frame.size.height = (self.view.frame.width / 1.8) + 10
                   
        view.layer.insertSublayer(gradientLayer, at:0)
         
        return view
    }()
    
    lazy var  ivPhotoMovieHead : UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    lazy var lblDateMovieLaunched : UILabel={
        let label = UILabel()
        label.numberOfLines = 0
        label.text = " "
        label.font = UIManager.RegularFont(8)
        label.textColor = UIManager.BASIC_WHITE
        return label
    }()
    
    lazy var ivIconFavDetail:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart.fill")
        image.tintColor = UIColor.red
        return  image
    }()
    
    
    lazy var btnAddFavorites : UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.tintColor = UIManager.BASIC_WHITE
        btn.layer.cornerRadius = 15
        btn.layer.backgroundColor = UIManager.MEDIUM_SOFT_DARK.cgColor
        return btn
    }()
    
    lazy var ivIconFav:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.tintColor = UIManager.BASIC_WHITE
        return  image
    }()
    
    lazy var ivRankingMovie = UIView()
    lazy var lblVotesMovie = UILabel()
    lazy var lblRankingMovie = UILabel()
    
    
    
    //MARK: Lifecycle
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIManager.BLUE_BG_MAIN
        uiType = Constants.UI_TYPE
        switch uiType {
        case .Profile:
            installTable(fetchedDataDummyProfile())
        case .MovieInfo:
            installTable(fetchedDataDummyMovie())
        case .NoDefined:
            break
        }
        
        
    }
    
    //MARK: Functions
    func installTable(_ model:[CollectionTableViewCellModel] = [])  {
        tableView = UITableView()
        tableView?.frame.origin.x = 0
        tableView?.frame.origin.y = 0
        tableView?.frame.size.width = view.frame.width
        tableView?.frame.size.height = view.frame.width / 0.7
        tableView?.backgroundColor = UIManager.BLUE_BG_MAIN
        guard let vt = tableView else { return }
        reusableTableView = ComponentDataSource(vt, 414, 414, model)
        reusableTableView.tableView.backgroundColor = UIManager.BLUE_BG_MAIN
        viewFavorites.addSubview(reusableTableView.tableView)
    }
    
    open func installView(_ model:ItemCollectionViewCellModel)  {
        let heightView = view.frame.height
        
        view.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.centerX.equalToSuperview()
        }
        
        switch uiType {
        case .Profile:
            
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
                make.top.equalTo(ivAvatar.snp.bottom).offset(20)
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
            
        case .MovieInfo:
            
            idLocal = model.id
            original_titleLocal = model.original_title
            imageLocal = model.image
            overviewLocal = model.overview
            release_dateLocal = model.release_date
            vote_averageLocal = model.vote_average
            vote_countLocal = model.vote_count
            
            view.addSubview(viewMovieTop)
            viewMovieTop.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.height.equalTo((heightView / 3) * 2)
            }
            viewMovieTop.insertSubview(ivPhotoMovieHead, at: 0)
            ivPhotoMovieHead.image = UIManager.getImageFromUrl(url: model.image)
            
            ivPhotoMovieHead.layer.zPosition = 0
            ivPhotoMovieHead.snp.makeConstraints { make in
                make.height.equalTo((self.view.frame.width / 1.8))
                make.width.equalToSuperview()
                make.top.equalTo(lblTitle.snp.bottom).offset(16)
            }
            
            
            viewMovieTop.insertSubview(stackInfoMovie, at: 1)
            stackInfoMovie.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.top.equalTo(lblTitle.snp.bottom).offset(16)
            }
            
            stackInfoMovie.addArrangedSubview(viewGradient)
            viewGradient.snp.makeConstraints { make in
                make.height.equalTo((self.view.frame.width / 1.8))
            }
            
           
            lblMovieTitle.text = model.original_title
            lblOverview.text = model.overview
            lblDateMovieLaunched.text = model.release_date
            
            stackInfoMovie.addArrangedSubview(lblMovieTitle)
            lblMovieTitle.setMargins(4)
            stackInfoMovie.addArrangedSubview(lblOverview)
            lblOverview.setMargins(8)
            stackInfoMovie.addArrangedSubview(lblDateMovieLaunched)
            lblDateMovieLaunched.setMargins(8)
             
            lblFavMovies.text = UIManager.production_companies
            
            viewGradient.addSubview(btnAddFavorites)
            btnAddFavorites.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(10)
                make.trailing.equalToSuperview().offset(-10)
                make.height.equalTo(30)
                make.width.equalTo(35)
            }
            
            ivRankingMovie.layer.cornerRadius = UIManager.cornerRadiusBtn - 2
            ivRankingMovie.layer.borderColor = UIManager.BASIC_WHITE.cgColor
            ivRankingMovie.layer.borderWidth = 1
            
            viewGradient.addSubview(ivRankingMovie)
            ivRankingMovie.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-8)
                make.bottom.equalToSuperview()
                make.height.equalTo(20)
                make.width.equalTo(58)
            }
            
            ivRankingMovie.addSubview(ivIconFavDetail)
            ivIconFavDetail.snp.makeConstraints { make in
                make.width.height.equalTo(10)
                make.leading.equalToSuperview().offset(10)
                make.centerY.equalToSuperview()
            }
            
            lblVotesMovie.text = "\(model.vote_count)"
            lblVotesMovie.font = UIManager.RegularFont(8)
            lblVotesMovie.textColor = UIManager.BASIC_WHITE
            ivRankingMovie.addSubview(lblVotesMovie)
            lblVotesMovie.snp.makeConstraints { make in
                make.leading.equalTo(ivIconFavDetail.snp.trailing)
                make.top.equalToSuperview().offset(5)
            }
            
            
            lblRankingMovie.text = "\(UIManager.getRate("\(model.vote_average)"))"
            lblRankingMovie.textAlignment = .center
            lblRankingMovie.font = UIManager.RegularFont(20)
            lblRankingMovie.textColor = UIManager.BASIC_WHITE
            lblRankingMovie.layer.borderWidth = 1
            lblRankingMovie.layer.cornerRadius = UIManager.cornerRadiusBtn - 4
            lblRankingMovie.layer.borderColor = UIManager.BASIC_WHITE.cgColor
            lblRankingMovie.layer.backgroundColor = UIManager.BASIC_SOFT_DARK.cgColor
            viewGradient.addSubview(lblRankingMovie)
            lblRankingMovie.snp.makeConstraints { make in
                make.bottom.equalTo(ivRankingMovie.snp.top).offset(-4)
                make.trailing.equalTo(ivRankingMovie.snp.trailing)
                make.width.equalTo(ivRankingMovie.snp.width)
                
            }
            
            view.addSubview(lblFavMovies)
            lblFavMovies.snp.makeConstraints { make in
                make.top.equalTo((heightView / 3) * 2)
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
            
            
            btnAddFavorites.addTarget(self, action: #selector(saveToFavorites), for: .touchUpInside)
            
            
        case .NoDefined:
            break
        }
        
        
        
    }

    //MARK: CoreDataActions
    @objc func saveToFavorites(){
        isFavorite = !isFavorite
        if !isFavorite{
            btnAddFavorites.setImage(UIImage(systemName: "heart"), for: .normal)
            btnAddFavorites.tintColor = UIManager.BASIC_WHITE
        }else{
            btnAddFavorites.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            btnAddFavorites.tintColor = .red
        }
    }
    
    
    //MARK: FAKE FETCH DUMMY
    func fetchedDataDummyMovie() -> [CollectionTableViewCellModel] {
        //MARK: Companies Dummy
        var collection:[CollectionTableViewCellModel] = []
        var item:[ItemCollectionViewCellModel] = []
        for _ in 1...6 {
            item.append(ItemCollectionViewCellModel(id: 1, original_title: "", image: UIManager.imgDummy, overview: "", release_date: "", vote_average: 0, vote_count: 0))
        }
        collection.append(CollectionTableViewCellModel(data: item))
        return collection
    }
    
    func fetchedDataDummyProfile() -> [CollectionTableViewCellModel] {
        //MARK: Companies Dummy
        var collection:[CollectionTableViewCellModel] = []
        var item:[ItemCollectionViewCellModel] = []
        
        item.append(ItemCollectionViewCellModel(id: 1, original_title: "모럴센스", image: "\(UIManager.imgDummyBase)/yQgGYiHUoDYeA4TbYlghpA5lmKH.jpg", overview: "", release_date: "2022-02-11", vote_average: 6.5, vote_count: 50))
        
        item.append(ItemCollectionViewCellModel(id: 1, original_title: "Dangerous", image: "\(UIManager.imgDummyBase)/vTtkQGC7qKlSRQJZYtAWAmYdH0A.jpg", overview: "", release_date: "2021-11-05", vote_average: 6.5, vote_count: 141))
        
        item.append(ItemCollectionViewCellModel(id: 1, original_title: "The Sky Is Everywhere", image: "\(UIManager.imgDummyBase)/qMVUlq6rdqFo1xZ5ozQcKFCDbgj.jpg", overview: "", release_date: "2022-02-11", vote_average: 6.1, vote_count: 11))
        
        item.append(ItemCollectionViewCellModel(id: 1, original_title: "Aşk Taktikleri", image: "\(UIManager.imgDummyBase)/9mXoEX9RNsRD1bG8nmJSfhwaM3O.jpg", overview: "", release_date: "2022-02-11", vote_average: 7, vote_count: 50))
        
        
        
        collection.append(CollectionTableViewCellModel(data: item))
        return collection
    }
}

extension DetailViewController:PresenterToViewProtocolDetail{
    func passModel(model: ItemCollectionViewCellModel) {
        installView(model)
    }
}


extension UILabel {
    func setMargins(_ margin: CGFloat = 10) {
        if let textString = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
