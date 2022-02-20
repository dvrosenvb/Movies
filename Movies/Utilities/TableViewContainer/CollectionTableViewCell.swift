//
//  CollectionTableViewCell.swift
//  Carousell
//
//  Created by Rosendo Vázquez on 19/02/22.
//

import UIKit

struct CollectionTableViewCellModel {
    let data:[ItemCollectionViewCellModel]
}

protocol CollectionTableViewCellDelegate:AnyObject {
    func collectionTableViewCellItemTapped(model:ItemCollectionViewCellModel)
}

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    static let identifier = "CollectionTableViewCell"
    private var dataModels : [ItemCollectionViewCellModel] = []
    
    weak var delegate:CollectionTableViewCellDelegate?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 2 )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIManager.BLUE_BG_MAIN
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        return collectionView
    }()
    
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIManager.BLUE_MAIN
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Layout - Add to view/layout
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
        
    }
    
    
    //MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier,
                                                            for: indexPath) as? ItemCollectionViewCell else{ fatalError()
        }
        cell.build(model: dataModels[indexPath.row])
        return cell
    }
    
    func build(model:CollectionTableViewCellModel){
        self.dataModels = model.data
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size:CGFloat = contentView.frame.width / 2.12
        return CGSize(width: size, height: size * 1.88)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let model = dataModels[indexPath.row]
        delegate?.collectionTableViewCellItemTapped(model: model)
    }
}
