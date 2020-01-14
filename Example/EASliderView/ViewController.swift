//
//  ViewController.swift
//  EASliderView
//
//  Created by Emre AYDIN on 12/13/2019.
//  Copyright © 2019 Emre AYDIN. All rights reserved.
//

import UIKit
import EASliderView

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderView: EASliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Seting the values
        sliderView.title = "Title here"
        sliderView.columns = ["Option 1", "Option 2", "Option 3"]
        
        sliderView.showInfoButton = true // default is false
        sliderView.onInfoButtonPressed = {
            print("Info button pressed..")
        }
        
        sliderView.showColumnLabels = true // default is true
        
        // Customizing slider
        sliderView.dotActiveColor = .black
        sliderView.dotPassiveColor = .red
        sliderView.lineActiveColor = .red
        sliderView.linePassiveColor = .black
        sliderView.thumbColor = .darkText
        
        sliderView.titleLabelFont = UIFont.systemFont(ofSize: 14)
        sliderView.titleLabelColor = .black
        sliderView.columnLabelFont = UIFont.systemFont(ofSize: 13)
        sliderView.columnLabelColor = .gray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

