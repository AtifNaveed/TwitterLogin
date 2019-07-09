//
//  ViewController.swift
//  TwitterLogin
//
//  Created by Atif on 09/07/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        login()
    }
    
    
    func login() {
        // Swift
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(session!.userName)");
                self.getEmail()
            } else {
                print("error: \(error!.localizedDescription)");
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
    
    func getEmail() {
        // Swift
        let client = TWTRAPIClient.withCurrentUser()
        client.requestEmail { email, error in
            if (email != nil) {
                print("signed in as \(String(describing: email))");
            } else {
                print("error: \(error!.localizedDescription)");
            }
        }
    }
    
}


