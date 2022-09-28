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
        label.text = ""
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
        
        beginTyping()
    }
    
    //change to next location name
    func changeLocationName(){
        self.locationText = locationsTextArray[stringIndex]
    }
    
    //start animating the text forward & reveal
    func beginTyping () {
        characterIndex = 0
        locationSemiText = ""
        let displayLink = CADisplayLink(target: self, selector: #selector(handleDisplayLink))
        displayLink.preferredFramesPerSecond = 4 // This value will decide the speed of typing on screen
        displayLink.add(to: .current, forMode: .default)
    }
    
    @objc func handleDisplayLink(_ displayLink: CADisplayLink) {
        if locationSemiText.count < locationText.count {
            locationSemiText.append( locationText[locationSemiText.endIndex] )
            locationLabel.text = "\(locationSemiText)|"
            characterIndex += 1
        }else {
            locationSemiText = locationText
            locationLabel.text = "\(locationSemiText)"
            displayLink.invalidate() // Must invalidate displayLink else runLoop wouldn't stop.
            beginHiding()
        }
    }
    
    //start animating the text backward & hide
    func beginHiding(){
        let displayLinkHide = CADisplayLink(target: self, selector: #selector(handleDisplayLinkHide))
        displayLinkHide.preferredFramesPerSecond = 4 // This value will decide the speed of typing on screen
        displayLinkHide.add(to: .current, forMode: .default)
    }
    
    @objc func handleDisplayLinkHide(_ displayLink: CADisplayLink) {
        
        if locationSemiText.count <= locationText.count && characterIndex != 0 {
            locationSemiText.removeLast()
            locationLabel.text = "\(locationSemiText)|"
            characterIndex -= 1
        }else {
            displayLink.invalidate() // Must invalidate displayLink else runLoop wouldn't stop.
            if stringIndex == (locationsTextArray.count - 1) {
                stringIndex = 0
            }else {
                stringIndex += 1
            }
            beginTyping()
        }
    }
}

