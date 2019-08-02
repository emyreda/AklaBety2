//
//  UInavigationConfigure.swift
//  AklaBety
//
//  Created by Mac on 8/2/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class UInavigationConfigure: UIViewController , UInavigationDelegateProtocols{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()

    }
    
    



//extension UInavigationConfigure:UInavigationDelegateProtocols{
    
    
        
        @objc func handleDismiss() {
            dismiss(animated: true, completion: nil)
            
            
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
        

}
