//
//  StartVC.swift
//  AklaBety
//
//  Created by Mac on 7/29/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    
    
    @IBAction func startButton(_ sender: Any) {
        
      
       
        
        
        let controller = LoginVC()
        present(UINavigationController(rootViewController: controller) , animated:true  , completion:nil)
        
        
        // or
        /*
         let vc  = LoginVC()
        self.navigationController?.pushViewController(vc, animated: true)
        */
        
        
        //or and add uiview , button as navigation controller
        
        /*
       let Contoller = LoginVC()
       present(Contoller, animated: true, completion: nil)
        
       */
        
     
    }
    

}
