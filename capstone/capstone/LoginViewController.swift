//
//  ViewController.swift
//  capstone
//
//  Created by Joohyung Ryu on 2017. 1. 24..
//  Copyright © 2017년 MSD. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // FaceBook Button
    //@IBOutlet weak var fbButton: UIButton!
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        guard let usernameData:String = usernameTextField.text else {
            //show("No name to submit")
            emptyLabels()
            return
        }
        
        guard let passowrdData:String = passwordTextField.text else {
            //show("No name to submit")
            emptyLabels()
            return
        }
        
        if (usernameData.isEmpty) || (passowrdData.isEmpty) {
            emptyLabels()
            return
        }
        
        let login = UserLogin( username: usernameData, password: passowrdData)
        
        if login.userLogin(loginType: "native") == true {
            
            //switch to view2
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : AnyObject! = storyboard.instantiateViewController(withIdentifier: "DashBoardViewController")
            self.show(vc as! UIViewController, sender: vc)
            
            print("Working!!")
            
        }
        else {
            print("Invalid Username")
        }
        
    }
    
    // Method signifies that some login labels are empty and should be filled
    func emptyLabels(){
    
        print("Empty Labels!!")
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

