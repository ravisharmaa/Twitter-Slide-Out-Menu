//
//  HomeVC.swift
//  Twitter Slide Out Menu
//
//  Created by Joe Langenderfer on 1/30/19.
//  Copyright © 2019 Joe Langenderfer. All rights reserved.
//

import UIKit

class HomeVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Slide Out Menu"
        return cell
    }

    // MARK:- Fileprivate
    
    fileprivate func setupNavigationBarItems() {
        navigationItem.title = "Home"
        setupCircularNavigationButton()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .heavy)]
    }
    
    fileprivate func setupCircularNavigationButton() {
        
        let customView = UIButton(type: .system)
        let imageName = "Profile-Picture"
        let url = URL(string: imageName) //
        customView.setImage(UIImage(named: imageName), for: .normal)
        customView.imageView?.contentMode = .scaleAspectFit
        customView.layer.cornerRadius = 30 / 2
        customView.clipsToBounds = true
        customView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        customView.addTarget(self, action: #selector(handleOpen), for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = barButtonItem
    }

}
