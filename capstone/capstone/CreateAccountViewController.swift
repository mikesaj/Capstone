//
//  SignUpViewController.swift
//  capstone
//
//  Created by Michael Sajuyigbe on 2017-02-03.
//  Copyright © 2017 MSD. All rights reserved.
//

import UIKit
/**
 This class performs the task to create a user account
 
 */
class CreateAccountViewController: UIViewController {

    
    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var Description: UITextView!
    @IBOutlet weak var password: UITextField!
    
    let loginView = LoginViewController();
    
    
    @IBAction func CreateAccount(_ sender: Any) {
        
        guard let personNameData:String = personName.text else {
            loginView.emptyLabels()
            return
        }
        
        guard let userEmailData:String = userEmail.text else {
            loginView.emptyLabels()
            return
        }
        
        guard let userNameData:String = userName.text else {
            loginView.emptyLabels()
            return
        }
        
        guard let passwordData:String = password.text else {
            loginView.emptyLabels()
            return
        }
        
        guard let DescriptionData:String = Description.text else {
            loginView.emptyLabels()
            return
        }
        
        // Calls the method that creates a user account
        self.CreateAccount(username: userNameData, password: passwordData, name: personNameData, email: userEmailData, description: DescriptionData)
        
        //if value == true {}
        
    }
    
    // Creates account and returns a boolean feedback
    func CreateAccount(username: String, password: String, name: String, email: String, description: String) -> Bool{
    
        return false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
