//
//  DesignableView.swift
//  EASliderView
//
//  Created by Emre AYDIN on 13.01.2020.
//

import UIKit

@objc protocol DesignableViewDelegate {
    @objc optional func onFocused(_ view: DesignableView)
}

public class DesignableView: UIView {

    var nibName = ""
    var view: UIView!

    var isEnabled: Bool = true {
        didSet {
            isUserInteractionEnabled = isEnabled
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        setupContentProperties()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func setupContentProperties() {

    }

}
