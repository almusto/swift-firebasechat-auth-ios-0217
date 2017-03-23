//
//  FirebaseManager.swift
//  Firechat
//
//  Created by Johann Kerr on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase


class FirebaseManager {
    
    class func login(email: String, password:String, completion: @escaping (Bool, Error?) -> ()) {

      FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
        if user != nil {
          completion(true, nil)
        } else {
          completion(false, error)
        }
      })
    }

  class func signUp(email: String, password: String, userName: String, completion: @escaping (Bool, Error?) -> ()) {
    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
      if user != nil {

        let name = ["userName" : "\(userName)"]
        FIRDatabase.database().reference().child("users").child(user!.uid).setValue(name)
        completion(true, nil)
      } else {
        completion(false, error)
      }
    })
  }

  class func signOut() {
    do {
      try FIRAuth.auth()?.signOut()
    } catch {
      

    }
  }

  class func resetPassword(email: String, completion: @escaping (Bool, Error?) -> ()) {
    FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
      if error == nil {
        completion(true, nil)
      } else {
        completion(false, error)
      }
    })
  }
  

}

