//
//  LoginViewController.swift
//  Time Capsule
//
//  Created by Sean Reinhardt on 2/8/15.
//  Copyright (c) 2015 Sean Reinhardt. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
    }




    @IBAction func login(sender: AnyObject) {
        var userName:String = usernameField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        var password:String = passwordField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if userName.utf16Count == 0 || password.utf16Count == 0
        {
            var alert = UIAlertController(title: "Oops", message: "Please enter a username and password", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            PFUser.logInWithUsernameInBackground(userName, password: password, block: { (user:PFUser!, error:NSError!) -> Void in
                if let err = error
                {
                    var alert = UIAlertController(title: "Error", message: "Please re-enter username and password", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else
                {
                    self.navigationController?.popToRootViewControllerAnimated(true)
                }
            })
        }
    
    }
    
}