//
//  LoggedInViewController.swift
//  Firechat
//
//  Created by Alessandro Musto on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class LoggedInViewController: UIViewController {

  var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = UIColor.white

      logoutButton = UIButton(type: UIButtonType.custom)
      logoutButton.setTitle("logout", for: .normal)
      logoutButton.backgroundColor = UIColor.blue
      logoutButton.addTarget(self, action: #selector(onLogout(_:)), for: .touchUpInside)
      logoutButton.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(logoutButton)

      logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
      logoutButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
      logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true




        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func onLogout(_ sender: UIButton) {
    FirebaseManager.signOut()
    self.dismiss(animated: true, completion: nil)

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
