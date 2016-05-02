//
//  ProtectedPageViewController.swift
//  FBLogin-iOS
//
//  Created by Vedran Stankovic on 02/05/2016.
//
//

import UIKit

class ProtectedPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func goToLoginPage() {
        let loginPage = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        let loginPageNav = UINavigationController(rootViewController: loginPage)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = loginPageNav
    }


}
