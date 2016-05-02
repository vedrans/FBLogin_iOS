//
//  ViewController.swift
//  FBLogin-iOS
//
//  Created by Vedran Stankovic on 02/05/2016.
//
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var loginBtn: FBSDKLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (FBSDKAccessToken.currentAccessToken() == nil ) {
            print("User is not logged in")
        } else {
            print("User is logged in")
        }
        
        loginBtn.delegate = self
        loginBtn.readPermissions = ["public_profile", "email"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!){
        
        if error != nil {
            print(error.localizedDescription)
            return
        }
        
        if (result.token) != nil
        {
            //Get user access token
            let token:FBSDKAccessToken = result.token
            
            print("Token = " + token.tokenString)
            print("User ID = " + token.userID)
            
        }

    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("user did log out")
    }



}

