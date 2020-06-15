//
//  CustomButton.swift
//  MyLifeFlims
//
//  Created by Daniyal Kausar on 14/06/2020.
//  Copyright © 2020 Daniyal Kausar. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeButtonRoundRect()
        setBorder()
        setBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        makeButtonRoundRect()
        setBorder()
        setBackground()
        //        fatalError("init(coder:) has not been implemented")
    }
    
    func makeButtonRoundRect() -> Void {
        self.layer.cornerRadius = self.frame.size.height/2
    }
    
    func setBorder() -> Void {
        self.layer.borderColor = UIColor(red: 17.0/255.0, green: 137.0/255.0, blue: 212.0/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 0.5
    }
    
    func setBackground(){
        self.backgroundColor = UIColor.white.withAlphaComponent(0.3)
    }
}
