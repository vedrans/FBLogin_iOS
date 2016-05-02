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
        
        loginBtn.delegate = self
        loginBtn.readPermissions = ["public_profile", "email"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if (FBSDKAccessToken.currentAccessToken() != nil ) {
            goToProtectedPage()
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
            
            goToProtectedPage()
            
        }

    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("user did log out")
    }
    
    
    func goToProtectedPage() {
        let protectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("ProtectedPageViewController") as! ProtectedPageViewController
        
        let protectedPageNav = UINavigationController(rootViewController: protectedPage)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = protectedPageNav
    }

}

