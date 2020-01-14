//
//  EASliderView.swift
//  EASliderView
//
//  Created by Emre AYDIN on 2.12.2019.
//  Copyright © 2019 Emre AYDIN. All rights reserved.
//

import UIKit

@IBDesignable public class EASliderView: DesignableView {
    
    @IBOutlet weak var columnContainerStackView: UIStackView!
    @IBOutlet weak var columnLabelsContainerStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoButtonContainerView: UIView!
    @IBOutlet weak var sliderContainerView: UIView!
    @IBOutlet weak var slider: UISlider!
    
    var onInfoButtonPressed: (()->Void)?
    var onSliderValueSelected: ((_ index: Int)->Void)?
    var value = 0 {
        didSet {
            if value <= Int(slider.maximumValue) {
                setSliderValue(value)
                onSliderValueSelected?(value)
            }
        }
    }
    
    public var columns: [String]! {
        didSet {
            setupTitleLabels()
            slider.maximumValue = Float(columns.count-1)
        }
    }
    
    public var title: String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var columnLabelColor: UIColor = UIColor.gray {
        didSet {
            columnLabel.textColor = columnLabelColor
        }
    }
    
    public var titleLabelColor: UIColor = UIColor.gray {
        didSet {
            titleLabel.textColor = titleLabelColor
        }
    }
    
    public var columnLabelFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            columnLabel.font = columnLabelFont
        }
    }
    
    public var titleLabelFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            columnLabel.font = titleLabelFont
        }
    }
    
    public var dotActiveColor = UIColor.blue
    
    public var dotPassiveColor = UIColor.gray
    
    public var lineActiveColor: UIColor = UIColor.blue {
        didSet {
            slider.minimumTrackTintColor = lineActiveColor
        }
    }
    
    public var linePassiveColor: UIColor = UIColor.gray {
        didSet {
            slider.maximumTrackTintColor = linePassiveColor
        }
    }
    
    public var thumbColor: UIColor = UIColor.blue {
        didSet {
            slider.thumbTintColor = thumbColor
        }
    }
    
    private var dotView: SliderDotView!
    
    private var columnLabel: UILabel!
    
    private var dotViews = [SliderDotView]()

    override func setup() {
        nibName = "EASliderView"
        super.setup()
    }
    
    override public func layoutSubviews() {
        setupSlider()
    }
    
    override func setupContentProperties() {
        layoutSubviews()
        
        slider.thumbTintColor = thumbColor
        slider.minimumTrackTintColor = lineActiveColor
        slider.maximumTrackTintColor = linePassiveColor
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderValueChanged(slider:event:)), for: .valueChanged)
        
        titleLabel.font = titleLabelFont
        titleLabel.textColor = titleLabelColor
    }

    @IBAction func infoButtonPressed(_ sender: UIButton) {
        onInfoButtonPressed?()
    }
    
    
    func setupTitleLabels() {
        columnLabelsContainerStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        for i in 0..<columns.count {
            let label = getTitleLabel()
            label.text = columns[i]
            columnLabelsContainerStackView.addArrangedSubview(label)
        }
    }
    
    func getTitleLabel() -> UILabel {
        let labelWidth = (columnLabelsContainerStackView.frame.size.width) / CGFloat(columns.count)
        columnLabel = UILabel(frame: CGRect(x: 0, y: 0, width: labelWidth, height: columnLabelsContainerStackView.frame.height))
        columnLabel.textAlignment = .center
        columnLabel.numberOfLines = 0
        columnLabel.font = columnLabelFont
        columnLabel.textColor = columnLabelColor
        return columnLabel
    }
    
    func setupSlider() {
        guard columns != nil && columns.count > 1 else {
            return
        }
        
        sliderContainerView.subviews.forEach {
            if $0 is SliderDotView {
                $0.removeFromSuperview()
            }
        }
        dotViews.removeAll()

        //0.65 proportion of slider to view, meaning slider width
        let spaceBetweenDots = (view.frame.size.width * 0.65 - CGFloat(columns.count * 26)) / CGFloat(columns.count-1)

        for i in 0..<columns.count {
            dotView = SliderDotView.fromNib()
            dotView.translatesAutoresizingMaskIntoConstraints = false
            dotView.dotLocation = (i == 0) ? DotLocation.Left : ( i == columns.count - 1 ? DotLocation.Right : DotLocation.Center)
            dotView.button.tag = i
            dotView.onTapped = { (button) in self.dotViewPressed(button)}
            dotViews.append(dotView)
            sliderContainerView.addSubview(dotView)
            sliderContainerView.bringSubviewToFront(dotView)

            let leading = (spaceBetweenDots * CGFloat(i)) + CGFloat(i * 26)

            dotView.leadingAnchor.constraint(equalTo: sliderContainerView.leadingAnchor, constant: leading).isActive = true
            dotView.centerYAnchor.constraint(equalTo: sliderContainerView.centerYAnchor, constant: 0).isActive = true
        }

        layoutIfNeeded()
        updateDotViews(with: value)
    }
    
    func updateDotViews(with interval: Int) {
        for i in 0..<dotViews.count {
            dotViews[i].isHidden = false
            if i < interval {
                dotViews[i].dotColor = dotActiveColor
            } else if i > interval {
                dotViews[i].dotColor = dotPassiveColor
            } else {
                dotViews[i].isHidden = true
            }
        }
    }
    
    func setSliderValue(_ value: Int) {
        updateDotViews(with: value)
        slider.setValue(Float(value), animated: false)
    }
    
    @objc func sliderValueChanged(slider: UISlider, event: UIEvent) {
        let value = Int(roundf(slider.value / 1) * 1)
        setSliderValue(value)
        
        if let touchEvent = event.allTouches?.first, touchEvent.phase == .ended {
            onSliderValueSelected?(value)
        }
    }
    
    @objc func dotViewPressed(_ sender: UIButton) {
        let value = Int(sender.tag)
        setSliderValue(value)
        onSliderValueSelected?(value)
    }
    
    //MARK: - Inspectables
    @IBInspectable var showTitles: Bool = true {
        didSet {
            columnLabelsContainerStackView.isHidden = !showTitles
            layoutIfNeeded()
        }
    }
    
    @IBInspectable var showInfoButton: Bool = false {
        didSet {
            infoButtonContainerView.isHidden = !showInfoButton
        }
    }
    
}

extension UIView {
    
    public class func fromNib<T : UIView>() -> T {
        return Bundle(for: self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}

