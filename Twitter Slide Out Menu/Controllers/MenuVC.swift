//
//  MenuVC.swift
//  Twitter Slide Out Menu
//
//  Created by Joe Langenderfer on 1/31/19.
//  Copyright © 2019 Joe Langenderfer. All rights reserved.
//

import UIKit

struct MenuItem {
    let icon: UIImage
    let title: String
}

extension MenuVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let slidingController = UIApplication.shared.keyWindow?.rootViewController as? BaseVC
        slidingController?.didSelectMenuItem(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

class MenuVC: UITableViewController {
    
    let customHeader = MenuHeaderView()
    let footerView = FooterView()
    
    let menuItems = [
        MenuItem(icon: UIImage(named: "Profile")!, title: "Profile"),
        MenuItem(icon: UIImage(named: "List")!, title: "Lists"),
        MenuItem(icon: UIImage(named: "Bookmark")!, title: "Bookmarks"),
        MenuItem(icon: UIImage(named: "Moments")!, title: "Moments"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        self.tableView.register(MenuItemCell.self, forCellReuseIdentifier: "menuCellId")
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return customHeader
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCellId", for: indexPath) as! MenuItemCell
        let menuItem = menuItems[indexPath.row]
        cell.iconImageView.image = menuItem.icon
        cell.titleLabel.text = menuItem.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

class FooterView: UIView {
    
    let moonIcon: UIButton = {
        let iv = UIButton()
        iv.setImage(UIImage(named: "Twitter-Moon"), for: .normal)
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let qrIcon: UIButton = {
        let iv = UIButton()
        iv.setImage(UIImage(named: "QR"), for: .normal)
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        addSubview(moonIcon)
        addSubview(qrIcon)
        
        moonIcon.anchor(top: nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: -25, paddingRight: 0, width: 30, height: 30)
        qrIcon.anchor(top: nil, left: nil, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -25, paddingRight: 20, width: 30, height: 30)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
