//
//  ViewController.swift
//  capstone
//
//  Created by Joohyung Ryu on 2017. 1. 24..
//  Copyright © 2017년 MSD. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        guard let username_data:String = usernameTextField.text else {
            //show("No name to submit")
            return
        }
        
        guard let passowrd_data:String = passwordTextField.text else {
            //show("No name to submit")
            return
        }
        
        if (username_data.isEmpty) || (passowrd_data.isEmpty) {
            return
        }

        let login = UserLogin( username: username_data, password: passowrd_data)
        
        if login.userLogin(loginType: "native") == true {
            
            //switch to view2
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : AnyObject! = storyboard.instantiateViewController(withIdentifier: "DashBoardController")
            self.show(vc as! UIViewController, sender: vc)
            
            print("Working!!")
            
        }
        else {
            
        }
        
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

