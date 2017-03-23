//
//  ForgotPWViewController.swift
//  Firechat
//
//  Created by Alessandro Musto on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class ForgotPWViewController: UIViewController {
  @IBOutlet weak var emailField: UITextField!

  var emailText: String!


    override func viewDidLoad() {
        super.viewDidLoad()

      emailField.text = emailText

    }


    
  @IBAction func resetFired(_ sender: UIButton) {

    FirebaseManager.resetPassword(email: emailField.text!) { (bool, error) in
      if bool == false {
        let alertVC = UIAlertController(title: "Reset Failed", message: error?.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action) in
        })
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
      } else {
        let alertVC = UIAlertController(title: "Email Sent", message: error?.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action) in
          self.dismiss(animated: true, completion: nil)
        })
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
      }
    }

  }



}
