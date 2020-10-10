//
//  ViewController.swift
//  TConverter
//
//  Created by Kseniia Prytkova on 10/7/20.
//  Copyright © 2020 Kseniia Prytkova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider! {
        didSet {
                   slider.maximumValue = 100
                   slider.minimumValue = 0
                   slider.value = 0
               }
    }
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let temperatureCelsius = Int(round(sender.value))
        celsiusLabel.text = "\(temperatureCelsius)ºC"
        
        let fahrenheitTemperature = Int(round((sender.value * 9 / 5) + 32))
        fahrenheitLabel.text = "\(fahrenheitTemperature)ºF"
    }
}
