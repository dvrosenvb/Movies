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
    
    private let models:[CollectionTableViewCellModel] = [
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home1", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Майор Гром: Чумной Доктор", image: "img", overview: "Igor Grom is a skilled policeman from St. Petersburg, known for his daring nature and uncompromising attitude towards the criminals of all kinds. Incredible strength, analytical mind and integrity – these qualities make Major Grom the perfect policeman. Working tirelessly, he always pushes through, and meets the challenges standing in the way.", release_date: "2021-04-01", vote_average: 6.8, vote_count: 399),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home3", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
        ]),
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home1", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Майор Гром: Чумной Доктор", image: "img", overview: "Igor Grom is a skilled policeman from St. Petersburg, known for his daring nature and uncompromising attitude towards the criminals of all kinds. Incredible strength, analytical mind and integrity – these qualities make Major Grom the perfect policeman. Working tirelessly, he always pushes through, and meets the challenges standing in the way.", release_date: "2021-04-01", vote_average: 6.8, vote_count: 399),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home3", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
        ]),
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home1", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Майор Гром: Чумной Доктор", image: "img", overview: "Igor Grom is a skilled policeman from St. Petersburg, known for his daring nature and uncompromising attitude towards the criminals of all kinds. Incredible strength, analytical mind and integrity – these qualities make Major Grom the perfect policeman. Working tirelessly, he always pushes through, and meets the challenges standing in the way.", release_date: "2021-04-01", vote_average: 6.8, vote_count: 399),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home3", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
        ]),
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home1", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Майор Гром: Чумной Доктор", image: "img", overview: "Igor Grom is a skilled policeman from St. Petersburg, known for his daring nature and uncompromising attitude towards the criminals of all kinds. Incredible strength, analytical mind and integrity – these qualities make Major Grom the perfect policeman. Working tirelessly, he always pushes through, and meets the challenges standing in the way.", release_date: "2021-04-01", vote_average: 6.8, vote_count: 399),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home3", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
        ]),
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home1", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Майор Гром: Чумной Доктор", image: "img", overview: "Igor Grom is a skilled policeman from St. Petersburg, known for his daring nature and uncompromising attitude towards the criminals of all kinds. Incredible strength, analytical mind and integrity – these qualities make Major Grom the perfect policeman. Working tirelessly, he always pushes through, and meets the challenges standing in the way.", release_date: "2021-04-01", vote_average: 6.8, vote_count: 399),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home3", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
        ]),
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home1", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Майор Гром: Чумной Доктор", image: "img", overview: "Igor Grom is a skilled policeman from St. Petersburg, known for his daring nature and uncompromising attitude towards the criminals of all kinds. Incredible strength, analytical mind and integrity – these qualities make Major Grom the perfect policeman. Working tirelessly, he always pushes through, and meets the challenges standing in the way.", release_date: "2021-04-01", vote_average: 6.8, vote_count: 399),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home3", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
        ])
        
    ]
    
       
    init(_ tv: UITableView, _ widthView:CGFloat, _ heightView:CGFloat) // Prepare for Model and type of view
        {            
            tableView = tv
            self.heightView = heightView
            self.widthView = widthView
            super.init()
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