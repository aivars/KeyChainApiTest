//
//  ViewController.swift
//  KeyChainApiTest
//
//  Created by Aivars Meijers on 25/09/2019.
//  Copyright © 2019 Aivars Meijers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var keyToSave: UITextField!
    @IBOutlet weak var entryData: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var keyToRead: UITextField!
    @IBOutlet weak var keyToDelete: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSaveButton(_ sender: Any) {
        KeyChainApi.save(entryData?.text ?? "no data provided", for: keyToSave.text ?? "secret")
    }
    
    @IBAction func onReadButton(_ sender: Any) {
        if let readData = KeyChainApi.retrive(for: keyToRead.text ?? "secret") {
            outputLabel.text = readData
        } else {
            outputLabel.text = "wtf?!"
        }
    }
    @IBAction func onRemoveButton(_ sender: Any) {
        KeyChainApi.remove(for: keyToDelete.text ?? "secret")
    }
}

