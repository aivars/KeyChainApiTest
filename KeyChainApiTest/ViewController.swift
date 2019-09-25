//
//  ViewController.swift
//  KeyChainApiTest
//
//  Created by Aivars Meijers on 25/09/2019.
//  Copyright © 2019 Aivars Meijers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var entryData: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSaveButton(_ sender: Any) {
        KeyChainApi.save(entryData?.text ?? "no data provided", for: "secret")
    }
    
    @IBAction func onReadButton(_ sender: Any) {
        if let readData = KeyChainApi.retrive(for: "secret") {
            outputLabel.text = readData
        } else {
            outputLabel.text = "wtf?!"
        }
    }
}

