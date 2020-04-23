//
//  MainViewController.swift
//  PT Hasten
//
//  Created by Albert on 23/04/2020.
//  Copyright © 2020 Albert. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ImageLoader

class MainViewController: UIViewController {
    
    // - PROPERTIES
    var playersDict = [String: [Player]]()

    // - OUTLETS
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.allowsSelection = false
        }
    }

    
    // - ACTIONS
    // - FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register Cell
        let nib = UINib(nibName: "PlayerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PlayerCell")

        _ = Player.getPlayers { (success, error) in
            guard let sports = Player.all.value(forKey: "@distinctUnionOfObjects.sport") as? [String] else { return }
            
            for sport in sports {
                self.playersDict[sport] = Player.all.filter("sport = %@", sport).toArray(ofType: Player.self)
            }
            self.tableView.reloadData()
        }
    }
}


extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(playersDict)[section].value.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return playersDict.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(playersDict)[section].key
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        
        let player = Array(playersDict)[indexPath.section].value[indexPath.row]
        
        cell.prepareForReuse()
        cell.nameLabel.text = player.name
        cell.surnameLabel.text = player.surname
        if let url = URL(string: player.imageUrl) {
            cell.pictureImageView.load.request(with: url)

        }
        
        return cell
    }
}
