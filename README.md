# EASliderView

[![CI Status](https://img.shields.io/travis/aydin-emre/EASliderView.svg?style=flat)](https://travis-ci.org/aydin-emre/EASliderView)
[![Version](https://img.shields.io/cocoapods/v/EASliderView.svg?style=flat)](https://cocoapods.org/pods/EASliderView)
[![License](https://img.shields.io/cocoapods/l/EASliderView.svg?style=flat)](https://cocoapods.org/pods/EASliderView)
[![Platform](https://img.shields.io/cocoapods/p/EASliderView.svg?style=flat)](https://cocoapods.org/pods/EASliderView)

Default EASliderView:
![EASliderView default](https://i.ibb.co/RNCwQSF/Simulator-Screen-Shot-i-Phone-11-Pro-2020-01-14-at-11-39-57.png)
EASliderView with info button:
![EASliderView with info button](https://i.ibb.co/N3jghbd/Simulator-Screen-Shot-i-Phone-11-Pro-2020-01-14-at-12-38-40.png)
Customized example:
![EASliderView customized](https://i.ibb.co/whfgYVM/Simulator-Screen-Shot-i-Phone-11-Pro-2020-01-14-at-12-40-22.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

EASliderView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EASliderView'
```

## How To Use

Firstly, import EASliderView to your project
```swift
import EASliderView
```

After importing EASliderView you will be able to create a slider view either using storyboard or using swift code.

For instance, using storyboard, create an empty view and in Identity Inspector change class name as EASliderView and drag it to your swift class. 
```swift
sliderView.title = "Title here"
sliderView.columns = ["Option 1", "Option 2", "Option 3"]
```
You can show or hide info button and column labels. And can detect info button pressed with using onInfoButtonPressed
```swift
sliderView.showColumnLabels = true // default is true

sliderView.showInfoButton = true // default is false
sliderView.onInfoButtonPressed = {
    print("Info button pressed..")
}
```

And also you can customize the slider.
```swift
sliderView.dotActiveColor = .black
sliderView.dotPassiveColor = .red
sliderView.lineActiveColor = .red
sliderView.linePassiveColor = .black
sliderView.thumbColor = .darkText

sliderView.titleLabelFont = UIFont.systemFont(ofSize: 14)
sliderView.titleLabelColor = .black
sliderView.columnLabelFont = UIFont.systemFont(ofSize: 13)
sliderView.columnLabelColor = .gray
```

## Author

aydin-emre, www.emr.ee

## License

EASliderView is available under the MIT license. See the LICENSE file for more info.
