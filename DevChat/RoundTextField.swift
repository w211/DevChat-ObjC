//
//  RoundTextField.swift
//  DevChat
//
//  Created by Richard Cuico on 11/17/16.
//  Copyright © 2016 Richard Cuico. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class  RoundTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
}
