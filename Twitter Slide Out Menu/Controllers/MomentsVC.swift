//
//  MomentsVC.swift
//  Twitter Slide Out Menu
//
//  Created by Joe Langenderfer on 1/31/19.
//  Copyright © 2019 Joe Langenderfer. All rights reserved.
//

import UIKit

class MomentsVC: UIViewController {
    
    let centerLabel: UILabel = {
        let label = UILabel()
        label.text = "Moments"
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
    }
    
    fileprivate func setupLabel() {
        view.backgroundColor = .white
        view.addSubview(centerLabel)
        centerLabel.frame = view.frame
        centerLabel.textAlignment = .center
    }
}
