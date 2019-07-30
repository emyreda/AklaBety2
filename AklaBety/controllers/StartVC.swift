//
//  StartVC.swift
//  AklaBety
//
//  Created by Mac on 7/29/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var topconspin: NSLayoutConstraint!
    
    
    
    
    @IBOutlet weak var logoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        UIView.animate(withDuration: 2.5, animations: ({
            
            
            self.logoImg.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI+10000))
            
            }))
        */
        animate()
       
    }

    
    
    
    func animate(){
        
        UIView.animate(withDuration: 5, delay: 3, options: .curveLinear, animations: {
            
            
            self.container.transform = CGAffineTransform.identity
            self.container.transform = CGAffineTransform(rotationAngle: -CGFloat.pi * 0.999)
            
        }) { (true) in
            
            
            
            UIView.animate(withDuration: 5, delay: 3, options: .curveLinear, animations: {
                
                self.container.transform = CGAffineTransform(rotationAngle: -CGFloat.pi * 0.999 * 2)
                
            }) {(true) in
            
            self.animate()
            
            
            
        }
        
        }
    }
    

    @IBAction func startButton(_ sender: Any) {
        
      
        let vc  = LoginVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    

}
