//
//  SignUpViewController.swift
//  Firechat
//
//  Created by Alessandro Musto on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  @IBOutlet weak var userNameField: UITextField!

  var emailText: String!
  var passwordText: String!

    override func viewDidLoad() {
        super.viewDidLoad()

      passwordField.isSecureTextEntry = true
      passwordField.autocorrectionType = .no
      emailField.autocorrectionType = .no

      passwordField.text = passwordText
      emailField.text = emailText

    }

    
  @IBAction func cancelFired(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }


  @IBAction func signUpFired(_ sender: UIButton) {

    if userNameField.text != nil {

        FirebaseManager.createUser(email: emailField.text!, password: passwordField.text!, userName: userNameField.text!, completion: { (bool, error) in
          if bool == false {
            let alertVC = UIAlertController(title: "Creation Failed", message: error?.localizedDescription, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action) in
            })
            alertVC.addAction(okAction)
            self.present(alertVC, animated: true, completion: nil)
          } else {
            let vc = LoggedInViewController()
            self.present(vc, animated: true, completion: nil)
          }
        })
    } else {
      let alertVC = UIAlertController(title: "Login Failed", message: "user name field blank", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action) in
      })
      alertVC.addAction(okAction)
      self.present(alertVC, animated: true, completion: nil)
    }


  }



    

}
