//
//  SplashVC.swift
//  MyLifeFlims
//
//  Created by Daniyal Kausar on 14/06/2020.
//  Copyright © 2020 Daniyal Kausar. All rights reserved.
//

import UIKit
import SwiftyGif

class SplashVC: UIViewController {

    @IBOutlet weak var logoYConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var imgHeart: UIImageView!
    @IBOutlet weak var lblCenter: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.settingGIF()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        self.Animation()

    }
    
    
    //MARK: - SettingView
    
    func settingGIF(){
        self.imgHeart.setImage( try! UIImage(imageName: "heart.gif")!, manager: .defaultManager, loopCount: -1)
        self.imgHeart.startAnimatingGif()
    }
    
    //MARK: - Animation
    
    ///Show Logo
    
    func Animation(){
        
        UIView.animate(withDuration: 1.2, animations: {
            
            ///Show Logo
            self.imgLogo.alpha = 1
            
        }) { (animate) in
            
            
                UIView.animate(withDuration: 1.0, animations: {
                    ///Move Logo
                    
                    let newConstraint = self.logoYConstraint.constraintWithMultiplier(0.35)
                                         self.view!.removeConstraint(self.logoYConstraint)
                                         self.logoYConstraint = newConstraint
                                         self.view!.addConstraint(self.logoYConstraint)
                                         self.imgLogo.alpha = 1.0
                                         self.view!.layoutIfNeeded()
                    
                
                 }) { (animate) in
                     
                    UIView.animate(withDuration: 1.2, animations: {
                             
                             ///Show Heart
                             self.imgHeart.alpha = 1
                        
                            ///Show Text

                            self.lblCenter.alpha = 1
                         }) { (animate) in
                            
                            let transition: CATransition = CATransition()
                            transition.duration = 0.4
                            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                            transition.type = CATransitionType.fade
                            self.navigationController!.view.layer.add(transition, forKey: nil)

                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginVC_ID") as! LoginVC
                            self.navigationController?.pushViewController(vc, animated: false)

                    }
                    
                    
                 }
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
