//
//  SignupViewController.swift
//  Time Capsule
//
//  Created by Sean Reinhardt on 2/8/15.
//  Copyright (c) 2015 Sean Reinhardt. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var passwordRepeatField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signup(sender: AnyObject) {
        
        var userName:String = usernameField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        var password:String = passwordField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        var passwordRepeat:String = passwordRepeatField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        var email:String = emailField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        
        if userName.utf16Count == 0 || password.utf16Count == 0 || email.utf16Count == 0 || passwordRepeat != password
        {
            var alert = UIAlertController(title: "Oops", message: "Please check username, password and email fields.  All field must be filled and password must match", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            var newUser:PFUser = PFUser()
            newUser.username = userName
            newUser.password = password
            newUser.email = email
            
            newUser.signUpInBackgroundWithBlock({ (success:Bool, error:NSError!) -> Void in
                
                if let err = error
                {
                    var alert = UIAlertController(title: "Oops", message: "Error with signup, please retry", preferredStyle: UIAlertControllerStyle.Alert)
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
