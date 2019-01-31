//
//  HomeVC.swift
//  Twitter Slide Out Menu
//
//  Created by Joe Langenderfer on 1/31/19.
//  Copyright © 2019 Joe Langenderfer. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    let centerLabel: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        setupLabel()
    }
    
    // MARK:- Fileprivate
    
    fileprivate func setupNavigationBarItems() {
        navigationItem.title = "Home"
        setupCircularNavigationButton()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .heavy)]
    }
    
    fileprivate func setupCircularNavigationButton() {
        
        let customView = UIButton()
        let imageName = "Profile-Picture"
        customView.setImage(UIImage(named: imageName), for: .normal)
        customView.imageView?.contentMode = .scaleAspectFit
        customView.layer.cornerRadius = 30 / 2
        customView.clipsToBounds = true
        customView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        customView.addTarget(self, action: #selector(handleOpen), for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    @objc func handleOpen() {
        (UIApplication.shared.keyWindow?.rootViewController as? BaseVC)?.openMenu()
    }
    
    @objc func handleHide() {
        (UIApplication.shared.keyWindow?.rootViewController as? BaseVC)?.closeMenu()
    }
    
    func hideCircularNavigationButton() {
        navigationItem.leftBarButtonItem = nil
    }
    
    fileprivate func setupLabel() {
        view.backgroundColor = .white
        view.addSubview(centerLabel)
        centerLabel.frame = view.frame
        centerLabel.textAlignment = .center
    }

}
