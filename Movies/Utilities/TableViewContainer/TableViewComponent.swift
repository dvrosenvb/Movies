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
    private let models:[CollectionTableViewCellModel] = []
    
    
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
