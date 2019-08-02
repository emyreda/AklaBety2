//
//  ForgetPassVC.swift
//  AklaBety
//
//  Created by Mac on 8/2/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ForgetPassVC: UIViewController {
    
    
    
    @IBOutlet weak var forgetTextField: TextFieldLayout!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureUI()
        
       
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
    
    
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func resetButt(_ sender: Any) {
        
        
        
        let controller = VerificationVC()
        present(UINavigationController(rootViewController: controller) , animated:true  , completion:nil)
        
        
    }
    
    
    
    
    // MARK: - Helper Functions
    
    func configureUI() {
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 23/255, green: 57/255, blue: 3/255, alpha: 1)
        
        navigationItem.title = "Forget Password"
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
    
    

}


