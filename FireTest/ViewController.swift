//
//  ViewController.swift
//  FireTest
//
//  Created by Praveen Samuel . J on 21/12/16.
//  Copyright © 2016 Praveen Samuel . J. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        FIRDatabase.database().reference().child("MuseumDatabase").child(self.textField.text!).observe(.value) { (snapshot: FIRDataSnapshot) in
            if (!snapshot.exists()){
                print("no data #########")
                
            }else{
                FIRDatabase.database().reference().child("MuseumDatabase").child(self.textField.text!).observeSingleEvent(of: .value, with: { (snapshot: FIRDataSnapshot) in
                    let value1 = snapshot.value as? String
                    if let actualValue = value1 {
                        self.label.text = actualValue
                    }
                    })
            }
        }
}
}
