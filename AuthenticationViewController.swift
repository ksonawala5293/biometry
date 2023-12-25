//
//  AuthenticationViewController.swift
//  biometry
//
//  Created by Apple on 22/06/23.
//

import UIKit

class AuthenticationViewController: UIViewController {
    private let biometricIDAuth = BiometricIDAuth()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnverifywithFaceIDTapped(_ sender: Any) {
        biometricIDAuth.canEvaluate { (canEvaluate, _, canEvaluateError) in
            guard canEvaluate else {
                // Face ID/Touch ID may not be available or configured
                return
            }
            
            biometricIDAuth.evaluate { (success, error) in
                guard success else {
                    print("Face ID/Touch ID may not be configured")
                    return
                }
                print("You are successfully verified")
            }
        }
    }
}
