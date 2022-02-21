//
//  ComponentDataSource.swift
//  Movies
//
//  Created by Rosendo Vázquez on 19/02/22.
//

import Foundation
import UIKit

protocol ComponentDataSourceProtocol : AnyObject {
    func elementTapped(model:ItemCollectionViewCellModel)
}


class ComponentDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView
    var heightView:CGFloat
    var widthView:CGFloat
    
    weak var delegate:ComponentDataSourceProtocol?
    
    private var models:[CollectionTableViewCellModel] = []
    
       
    init(_ tv: UITableView, _ widthView:CGFloat, _ heightView:CGFloat, _ modelGeneral:[CollectionTableViewCellModel] = [])
        {            
            tableView = tv
            self.heightView = heightView
            self.widthView = widthView
            super.init()
            self.models = modelGeneral
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        }
    
    func tapped(model:ItemCollectionViewCellModel){
        delegate?.elementTapped(model: model)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier,
                                                       for: indexPath) as? CollectionTableViewCell else { fatalError() }
        
        cell.delegate = self
        cell.build(model: model)
        return  cell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return widthView / 1.09
    }
}

extension ComponentDataSource:CollectionTableViewCellDelegate{
    func collectionTableViewCellItemTapped(model: ItemCollectionViewCellModel) {
        Constants.UI_TYPE = .MovieInfo
        print("Tapped: \(model.original_title)")
        print(Constants.URL_IMAGE)
        print(Constants.URL_BASE)
        tapped(model: model)
    }
}
