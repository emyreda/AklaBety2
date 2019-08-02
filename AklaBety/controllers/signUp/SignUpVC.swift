//
//  SignUpVC.swift
//  AklaBety
//
//  Created by Mac on 8/2/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import GoogleSignIn


class SignUpVC: UIViewController , GIDSignInUIDelegate , UIImagePickerControllerDelegate,UINavigationControllerDelegate
{

    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var AddImgButt: UIButton!
    @IBOutlet weak var googleSignIn: GIDSignInButton!
    var imagePicker:UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        makeCircularView(view: userImg, borderColor: UIColor(red: 23/255, green: 57/255, blue: 3/255, alpha: 1) , borderWidth:1.5)
        
         makeCircularView(view: AddImgButt, borderColor: UIColor(red: 23/255, green: 57/255, blue: 3/255, alpha: 1) , borderWidth:0.0)
        
        configureUI()
        GIDSignIn.sharedInstance().uiDelegate = self

    }


    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    func makeCircularView(view:UIView , borderColor:UIColor , borderWidth:CGFloat){
        
        
        view.layer.cornerRadius = view.frame.size.width/2
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth

        
        
    }
    
    @IBAction func AddImg(_ sender: Any) {
        
     present(imagePicker,animated:true,completion: nil)

    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            
            
            userImg.image = img
            
            
            
            
        }
        
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func googleSignInAction(_ sender: Any) {
        
        
        GIDSignIn.sharedInstance().signIn()

       
    }
    
    
    @IBAction func goToLoginVC(_ sender: Any) {
        
        
        
        let controller = LoginVC()
        present(UINavigationController(rootViewController: controller) , animated:true  , completion:nil)
        
        
        
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 23/255, green: 57/255, blue: 3/255, alpha: 1)
        
        navigationItem.title = "Sign Up "
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
