//
//  SignUpViewController.swift
//  SoleekLabTask
//
//  Created by Ahmed Adel on 5/23/19.
//  Copyright © 2019 Ahmed Adel. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confpassText: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signupTapped(_ sender: UIButton)
    {
        if passwordText.text == confpassText.text && passwordText.text != "" && emailText.text != ""{
            Auth.auth().createUser(withEmail:emailText.text!,password:passwordText.text! , completion:{(user,error) in
                if user != nil{
                    print("Suceess")
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginViewController")
                    self.present(newViewController, animated: true, completion: nil)
                }else{
                    if let myError = error?.localizedDescription{
                        print(myError)
                    }else{
                        print("Error")
                    }
                }
                
            })
        }
        else{
            
        }
    }
    

}
