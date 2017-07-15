//
//  FacialExpression.swift
//  FaceIt
//
//  Created by ZhangChuanhui on 7/14/17.
//  Copyright © 2017 ZhangChuanhui. All rights reserved.
//

import Foundation

// UI-Independent representation of facial expression

struct FacialExpression {
    enum Eyes: Int {
        case Open
        case Closed
        case Squinting
    }
    
    enum EyeBrows: Int {
        case Relaxed
        case Normal
        case Furrowed
        
        func moreRelaxedBrow() -> EyeBrows {
            return EyeBrows(rawValue: rawValue - 1) ?? .Relaxed
        }
        
        func moreFurrowedBrow() -> EyeBrows {
            return EyeBrows(rawValue: rawValue + 1) ?? .Furrowed
        }
    }
    
    enum Mouth: Int {
        case Frown
        case Smirk
        case Neural
        case Grin
        case Smile
        
        func sadderMouth() -> Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .Frown
        }
        
        func happierMouth() -> Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .Smile
        }
    }
    
    var eyes: Eyes
    var eyeBrows: EyeBrows
    var mouth: Mouth
}
