//
//  ViewController.swift
//  FBLogin
//
//  Created by Mathan on 1/18/18.
//  Copyright © 2018 Ruah. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

extension UIView {
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.clipsToBounds = true
    }
}

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var profileImage: FBSDKProfilePictureView!
    
    @IBOutlet weak var fbLoginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add a custom login button to your app
        profileImage.makeCircular()
        fbLoginButton.delegate = self
        
        if(FBSDKAccessToken.current() == nil)
        {
            print("not logged in")
        }
        else{
            print("logged in already")
            
        }
        
//        let myLoginButton = UIButton(type: .custom)
//        myLoginButton.backgroundColor = UIColor.blue
//        myLoginButton.frame = CGRect(x: 100, y: 400, width: 100, height: 50);
//       // myLoginButton.center = view.center
//        myLoginButton.setTitle("Login with Facebook", for: .normal)
//
//        // Handle clicks on the button
//        myLoginButton.addTarget(self, action: #selector(self.loginButtonPressed) , for: .touchUpInside)
//
//        // Add the button to the view
//        view.addSubview(myLoginButton)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    @objc func loginButtonPressed() {
//
//        let loginManager = FBSDKLoginManager()
//        loginManager.logIn(withReadPermissions: [ "public_profile" ,"email" ], from: self) { loginResult,error  in
//
//            if error != nil {
//                print("error")
//            }else if(loginResult?.isCancelled)!{
//                print("result cancelled")
//            }else {
//                print("success")
//                self.updateUserInfo()
//
//            }
//        }
//
//    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        updateUserInfo()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func updateUserInfo()
    {
        let graphRequest:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"first_name,email, picture.type(large)"])
        
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                print("Error: \(error)")
            }
            else
            {
                let data:[String:AnyObject] = result as! [String : AnyObject]
                
                //print(data["email"])
                print(data)
                
            }
        })
        
//        let profilePictureView = FBSDKProfilePictureView()
//        profilePictureView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        profilePictureView.profileID = FBSDKAccessToken.current().userID
//        view.addSubview((profilePictureView))
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

