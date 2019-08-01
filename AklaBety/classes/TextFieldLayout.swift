//
//  TextFieldLayout.swift
//  AklaBety
//
//  Created by Mac on 7/31/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
@IBDesignable

class TextFieldLayout: UITextField {
    
    
    override func awakeFromNib() {
        setupTextField()
    }
    
    func setupTextField(){
   
        self.layer.cornerRadius = 18
        clipsToBounds = true
        self.layer.masksToBounds = true
       let myColor =  UIColor(red: 23/255, green: 57/255, blue: 3/255, alpha: 1)
        self.layer.borderColor = myColor.cgColor
        layer.borderWidth = 1
    }
  
 
    // Provides left padding for images
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x += rightPadding
        return textRect
    }
 
    
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            
            
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = -12
    
    @IBInspectable var color: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 2, y: 2, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            rightView = imageView
            
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
        
        
        
    }
    
}
