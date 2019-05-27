//
//  ViewController.swift
//  SoleekLabInternTask
//
//  Created by Ahmed Adel on 5/26/19.
//  Copyright © 2019 Ahmed Adel. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
//import FacebookLogin
import FBSDKLoginKit


class ViewController: UIViewController,GIDSignInUIDelegate,FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signinbutton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet weak var googleSignButton: GIDSignInButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signinbutton.layer.cornerRadius = 5
        signinbutton.layer.borderWidth = 1
        signinbutton.layer.borderColor = UIColor.black.cgColor
        
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.black.cgColor
        
        //GIDSignIn.sharedInstance().delegate = self as! GIDSignInDelegate
        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
        
        //tapGesture.cancelsTouchesInView = false
        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 70, y: 500, width: view.frame.width - 140, height: 50)
        
        loginButton.delegate = self
        
        
    }
    
    
    @IBAction func signInTapped(_ sender: UIButton)
    {
        if email.text != "" && password.text != ""{
            Auth.auth().signIn(withEmail:email.text!,password:password.text!,completion:{(user,error) in
                if user != nil
                {
                    print("You are signed in")
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
                    self.present(newViewController, animated: true, completion: nil)
                }
                else
                {
                    if let myError = error?.localizedDescription{
                        print(myError)
                    }else{
                        print("Error")
                    }
                }
            })
        }else{
            title = "Invalid email or password"
            let ac = UIAlertController(title: title, message: "Please type user name and password", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title:"Continue",style:.default,handler:nil))
            present(ac,animated: true)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Logged out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print("There is a problem")
        }else{
            print("Sucessfully logged in into facebook")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController")
            self.present(newViewController, animated: true, completion: nil)
        }
    }
    
    
    
    
}

