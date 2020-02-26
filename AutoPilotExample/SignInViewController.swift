//
//  SignInViewController.swift
//  AutoPilotExample
//
//  Created by Ella Lawrence (student LM) on 2/26/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if emailTextField.isFirstResponder{
            userNameTextField.becomeFirstResponder()
        }
        else if userNameTextField.isFirstResponder {
            passwordTextField.becomeFirstResponder()
        }
        else {
            passwordTextField.resignFirstResponder()
            signUpButton.isEnabled = true
        }
        
        return true
    }
    
    
    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        guard let userName = userNameTextField else {return}
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) {
            user, error in
            
            if let _ = user {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = userName.text
                changeRequest?.commitChanges(completion: { (error) in
                    print("couldn't change name")
                    
                })
                self.dismiss(animated: true, completion: nil)
            }
            else {
                print(error.debugDescription)
            }
        }
        
        
    }
    
}
