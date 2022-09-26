//
//  ViewController.swift
//  TypeAnimationDemo
//
//  Created by Aboelnaga on 26/09/2022.
//

import UIKit

class ViewController: UIViewController {

    //create lable to display locations
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "fhgfhfdhjhgjhgf"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.backgroundColor = .secondarySystemBackground
        label.textColor = .systemIndigo
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(locationLabel)
        locationLabel.frame = view.frame
    }


}

