//
//  TableViewViewController.swift
//  Carousell
//
//  Created by Rosendo Vázquez on 19/02/22.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIManager.BLUE_MAIN
        return tableView
    }()
    
    //MARK: DataSource Local
    private let models:[CollectionTableViewCellModel] = [
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home1", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Майор Гром: Чумной Доктор", image: "img", overview: "Igor Grom is a skilled policeman from St. Petersburg, known for his daring nature and uncompromising attitude towards the criminals of all kinds. Incredible strength, analytical mind and integrity – these qualities make Major Grom the perfect policeman. Working tirelessly, he always pushes through, and meets the challenges standing in the way.", release_date: "2021-04-01", vote_average: 6.8, vote_count: 399),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home3", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home4", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home5", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home6", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home7", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home8", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
            
        ]),
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
            
        ]),
        
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
            
        ]),
        
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
            
        ]),
        
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)
            
        ]),
        
        CollectionTableViewCellModel(data: [
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970),
            ItemCollectionViewCellModel(original_title: "Spider-Man: No Way Home", image: "img", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", release_date: "2021-12-15", vote_average: 8.4, vote_count: 7970)  
        ])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIManager.BLUE_MAIN
        view.addSubview(mainTableView)
        mainTableView.backgroundColor = UIManager.BLUE_BG_MAIN
        mainTableView.separatorColor = UIManager.BLUE_BG_MAIN
        mainTableView.separatorStyle = .none
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }

    override func viewDidLayoutSubviews() {
        mainTableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier,
                                                       for: indexPath) as? CollectionTableViewCell else { fatalError() }
        
        cell.delegate = self
        cell.build(model: model)
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width / 1.09
    }
    

}

extension TableViewViewController:CollectionTableViewCellDelegate{
    func collectionTableViewCellItemTapped(model: ItemCollectionViewCellModel) {
        print("Tapped: \(model.original_title)")
        
    }
    
    
}
