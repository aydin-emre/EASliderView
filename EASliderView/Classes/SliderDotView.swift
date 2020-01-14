//
//  SliderDotView.swift
//  EASliderView
//
//  Created by Emre AYDIN on 2.12.2019.
//  Copyright © 2019 Emre AYDIN. All rights reserved.
//

import UIKit

enum DotLocation: UInt  {
    case Left = 0,
    Right,
    Center
    
    var leading: CGFloat {
        switch self {
        case .Left:
            return 0
        case .Right:
            return 20
        case .Center:
            return 10
        }
    }
}

class SliderDotView: UIView {
    
    @IBOutlet weak var leadingConstraintForDot: NSLayoutConstraint!
    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var button: UIButton!
    
    var onTapped: ((_ sender: UIButton) -> Void)?
    
    var dotLocation: DotLocation = .Left {
        didSet {
            leadingConstraintForDot.constant = dotLocation.leading
            layoutIfNeeded()
        }
    }
    
    var dotColor: UIColor = UIColor.gray {
        didSet {
            dotView.backgroundColor = dotColor
        }
    }

    @IBAction func onButtonPressed(_ sender: Any) {
        onTapped?(button)
    }
}
