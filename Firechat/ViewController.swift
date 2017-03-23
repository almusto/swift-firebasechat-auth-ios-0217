//
//  ViewController.swift
//  Firechat
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passordField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

      passordField.isSecureTextEntry = true
      passordField.autocorrectionType = .no
      emailField.autocorrectionType = .no

        
    }

  @IBAction func loginFired(_ sender: UIButton) {

    FirebaseManager.login(email: emailField.text!, password: passordField.text!) { (bool, error) in
      if bool == false {
        let alertVC = UIAlertController(title: "Login Failed", message: error?.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action) in
        })
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
      } else {
        let vc = LoggedInViewController()
        self.present(vc, animated: true, completion: nil)
      }
    }

  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "create" {
      let dest = segue.destination as! SignUpViewController
      if let email = emailField.text {
        dest.emailText = email
      }
      if let password = passordField.text {
        dest.passwordText = password
      }
    }

    if segue.identifier == "forgot" {
      let dest = segue.destination as! ForgotPWViewController
      if let email = emailField.text {
        dest.emailText = email
      }
    }
  }
   
}
