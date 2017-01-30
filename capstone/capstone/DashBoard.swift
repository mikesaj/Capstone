//
//  DashBoard.swift
//  capstone
//
//  Created by Michael Sajuyigbe on 2017-01-30.
//  Copyright © 2017 MSD. All rights reserved.
//
import Foundation
import UIKit

class DashBoard:UIViewController {

    
    
    @IBOutlet weak var title2: UILabel!
    
    func namrss() {
        title2.text = "Works now!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
