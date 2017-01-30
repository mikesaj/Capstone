//
//  User.swift
//  capstone
//
//  Created by Michael Sajuyigbe on 2017-01-28.
//  Copyright © 2017 MSD. All rights reserved.
//

import Foundation

class User {
    
    var username: String? = nil
    var firstname: String? = nil
    var city: String? = nil
    var country: String? = nil
    var LatestGpsCordinate: [String: Float32] = [:]
    var fitnest_groups_id: [Int : Int] = [:]

    
    // User preference to store user login state
    let user_session_data = UserDefaults.standard
    
    
    func get_Currt_User() {
        
        let userLogin2 = UserLogin()
        let login_status = userLogin2.isUserLoggedIn()
        
        if login_status == false {
            
            // open new layout view
            get_Currt_User()
            return
        }
    }

}

