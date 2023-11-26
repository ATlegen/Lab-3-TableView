//
//  ViewController.swift
//  tableview
//
//  Created by Assemgul on 26.11.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var text: UITextView!
    
    var country = ""
    var city = ""
    var imageName = ""
    
    var place = Place()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelCountry.text = place.country
        labelCity.text = place.city
        imageView.image = UIImage(named: place.imageName)
        text.text = place.text
    }


}

