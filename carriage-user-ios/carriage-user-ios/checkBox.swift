//
//  checkBox.swift
//  carriage-user-ios
//
//

import Foundation
import UIKit
class checkBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "checkedbox")! as UIImage

    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
                self.layer.borderWidth = 0
            } else {
                self.setImage(nil, for: UIControl.State.normal)
                self.layer.borderWidth = 1.0
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        buttonClicked(sender: self)
        super.touchesBegan(touches, with: event)
    }


    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
