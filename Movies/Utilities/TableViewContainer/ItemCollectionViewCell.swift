//
//  ItemCollectionViewCell.swift
//  Carousell
//
//  Created by Rosendo Vázquez on 19/02/22.
//

import UIKit
import SnapKit

public struct ItemCollectionViewCellModel {
    let id:Int
    let original_title:String
    let image:String
    let overview:String
    let release_date:String
    let vote_average:Double
    let vote_count:Int
}

public struct ItemCollectionViewCellModelCodable:Codable {
    let id:Int
    let original_title:String
    let image:String
    let overview:String
    let release_date:String
    let vote_average:Double
    let vote_count:Int
}

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        for view in contentView.subviews {
            view.removeFromSuperview()
        }
    }
    
    
    func build(model:ItemCollectionViewCellModel){
        
        contentView.backgroundColor = UIManager.BLUE_MAIN
        contentView.layer.borderColor = UIManager.BLUE_BORDER.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = UIManager.cornerRadiusBtn
        
        lazy var ivMovie:UIImageView = {
            let iv = UIImageView()
            iv.clipsToBounds = true
            iv.contentMode = .scaleAspectFill
            iv.layer.cornerRadius = UIManager.cornerRadiusBtn
            iv.image = UIManager.getImageFromUrl(url: model.image)
            return iv
        }()
        
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height
        
        lazy var lblDate : UILabel = {
            let label = UILabel()
            label.text = model.release_date
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = UIManager.RegularFont(8)
            label.textColor = UIManager.BASIC_WHITE
            label.layer.backgroundColor = UIManager.MEDIUM_SOFT_DARK.cgColor
            label.layer.borderWidth = 1
            label.layer.borderColor = UIManager.BLUE_SECONDARY.cgColor
            label.layer.cornerRadius = 6
            return label
        }()
        
        lazy var lblName : UILabel = {
            let label = UILabel()
            label.text = model.original_title
            label.numberOfLines = 0
            label.textAlignment = .left
            label.font = UIManager.RegularFont(14)
            label.textColor = UIManager.BASIC_WHITE
            return label
        }()
        
        
        lazy var lblDescription : UILabel = {
            let label = UILabel()
            label.text = model.overview
            label.numberOfLines = 0
            label.textAlignment = .left
            label.font = UIManager.RegularFont(10)
            label.textColor = UIManager.BASIC_WHITE
            return label
        }()
        
        ivMovie.frame.origin.y = 0
        ivMovie.frame.origin.x = 0
        
        ivMovie.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(150)
        }
        
        lblName.frame.origin.x = 8
        lblName.frame.origin.y = 160
        lblName.frame.size.width = width - 16
        lblName.frame.size.height = (height / 6)
        
        let bottomLblName = lblName.frame.origin.y + lblName.frame.size.height
        
        lblDescription.frame.origin.x = 8
        lblDescription.frame.origin.y = bottomLblName
        lblDescription.frame.size.width = width - 16
        lblDescription.frame.size.height = (height / 4)
        
        lblDate.frame.origin.x = 8
        lblDate.frame.origin.y = 135
        lblDate.frame.size.width = width / 2.7
        lblDate.frame.size.height = 12
        
        
        
        contentView.addSubview(ivMovie)
        contentView.addSubview(lblDate)
        contentView.addSubview(lblName)
        contentView.addSubview(lblDescription)
        
    }
}
