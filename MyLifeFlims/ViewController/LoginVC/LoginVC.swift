//
//  LoginVC.swift
//  MyLifeFlims
//
//  Created by Daniyal Kausar on 14/06/2020.
//  Copyright © 2020 Daniyal Kausar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var imgBG: UIImageView!
    
    @IBOutlet weak var lblBottom: UILabel!

    @IBOutlet weak var btnFlim: UIButton!
    
    @IBOutlet weak var btnPhoto
    : UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingBottomText()
       
        
     
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1.5, animations: {
            self.imgBG.alpha = 0.8
            self.btnFlim.alpha = 1
            self.btnPhoto.alpha = 1
            self.lblBottom.alpha = 1

        }) { (animate) in
            
        }
    }
    
    
    
    func settingBottomText(){
        let text = "ABOUT US  |  TERMS & CONDITIONS  |  PRIVACY POLICY"
        self.lblBottom.textColor =  UIColor.white
        let underlineAttriString = NSMutableAttributedString(string: text)
        
        
        
        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 18) , range: NSMakeRange(0, text.count))
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSMakeRange(0, text.count))
        
        
        
        
        lblBottom.isUserInteractionEnabled = true
        lblBottom.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
        lblBottom.attributedText = underlineAttriString

        self.lblBottom.adjustsFontSizeToFitWidth = true;
        self.lblBottom.numberOfLines = 1;
        self.lblBottom.minimumScaleFactor = 0.5;
        

    }
    
    
    
    
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        let termsRange = (lblBottom.text as! NSString).range(of: "TERMS & CONDITIONS")
        let aboutusRange = (lblBottom.text as! NSString).range(of: "ABOUT US")
        let privacyRange = (lblBottom.text as! NSString).range(of: "PRIVACY POLICY")

        
       // comment for now
       //let privacyRange = (text as NSString).range(of: "Privacy Policy")

        if gesture.didTapAttributedTextInLabel(label: lblBottom, inRange: termsRange) {
           print("Tapped terms")
       }else if gesture.didTapAttributedTextInLabel(label: lblBottom, inRange: aboutusRange) {
           print("Tapped about us")
       }else if gesture.didTapAttributedTextInLabel(label: lblBottom, inRange: privacyRange) {
           print("Tapped privacy")
       } else {
           print("Tapped none")
       }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
