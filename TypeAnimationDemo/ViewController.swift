//
//  ViewController.swift
//  TypeAnimationDemo
//
//  Created by Aboelnaga on 26/09/2022.
//

import UIKit

class ViewController: UIViewController {

    //lable to display locations
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
    
    //variables for locations name
    var locationSemiText = ""
    var locationText = "Sahl Hasheesh"
    let locationsTextArray = ["Sahl Hasheesh", "Cairo", "El Gouna", "North Coast"]
    
    var characterIndex: Int = 0 //variable to store the character index to start the reverse animation
    var stringIndex: Int = 0 { //variable to store the location index to start the it`s animation
        didSet {
            changeLocationName() //change to next location name whenever stringIndex changed
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(locationLabel)
        locationLabel.frame = view.frame
    }
    
    //change to next location name
    func changeLocationName(){
        self.locationText = locationsTextArray[stringIndex]
    }
}

