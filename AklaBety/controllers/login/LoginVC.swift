//
//  LoginVC.swift
//  AklaBety
//
//  Created by Mac on 7/29/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import GoogleSignIn
class LoginVC: UIViewController , GIDSignInUIDelegate {


    @IBOutlet weak var signInButt: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
         configureUI()
         GIDSignIn.sharedInstance().uiDelegate = self

    }

    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func googleSignInButton(_ sender: Any) {
        
        
        GIDSignIn.sharedInstance().signIn()

    }
    
    
    @IBAction func createAccount(_ sender: Any) {
        
        
        let controller = SignUpVC()
        present(UINavigationController(rootViewController: controller) , animated:true  , completion:nil)
      
    }
    
    
    
    
    
    // MARK: - Helper Functions
    
    func configureUI() {

        
        navigationController?.navigationBar.barTintColor = UIColor(red: 23/255, green: 57/255, blue: 3/255, alpha: 1)
        
       navigationItem.title = "Log In"
       navigationController?.navigationBar.barStyle = .black
        
        // UIbutton
        let backbutton = UIButton(type: .custom)
        
        // backbutton.setTitle("<", for: .normal)
        backbutton.setImage(UIImage(named: "Backward arrow-1"), for: .normal)
        backbutton.setTitleColor(.red, for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: Selector(("handleDismiss")), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
        
    }
    
    
    
    @IBAction func forgetPass(_ sender: Any) {
        
        let controller = ForgetPassVC()
        present(UINavigationController(rootViewController: controller) , animated:true  , completion:nil)
        
        
    }
    
    
    
    // handel view keyboard dismiss
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // handel textfields  keyboard dismiss
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
}
