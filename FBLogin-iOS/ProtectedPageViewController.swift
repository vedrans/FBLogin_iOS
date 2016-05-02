//
//  ProtectedPageViewController.swift
//  FBLogin-iOS
//
//  Created by Vedran Stankovic on 02/05/2016.
//
//

import UIKit
import FBSDKLoginKit

class ProtectedPageViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var logoutBtn: FBSDKLoginButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutBtn.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
  
        if (FBSDKAccessToken.currentAccessToken() == nil ) {
            goToLoginPage()
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!){
        
        if error != nil {
            print(error.localizedDescription)
            return
        }
        
        if (result.token) != nil
        {
            
            print("Token = \(FBSDKAccessToken.currentAccessToken().tokenString)")
            
            print("User ID = \(FBSDKAccessToken.currentAccessToken().userID)")
            
            // do something
            
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        goToLoginPage()
    }
    
    func goToLoginPage() {
        let loginPage = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        let loginPageNav = UINavigationController(rootViewController: loginPage)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = loginPageNav
    }


}
