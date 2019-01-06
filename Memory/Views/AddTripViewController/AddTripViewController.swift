//
//  AddTripViewController.swift
//  Memory
//
//  Created by 10.12 on 2019/1/6.
//  Copyright © 2019 Rui. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?  // it's a function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLable.font = UIFont(name: Theme.mainFontName, size: 25)

    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        TripFunctions.createTrip(tripModel: TripModel(title: tripTextField.text!))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    

}
