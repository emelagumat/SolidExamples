
import UIKit
import Combine
import App

class AnySwitchTableViewCell<Model: AnySwitchCellViewModel>: AnyTableViewCell {
    lazy var toggle = UISwitch()
    
    override func setupView() {
        super.setupView()
        accessoryView = toggle
    }
    
    override func bindAction() {
        toggle.addTarget(
            self,
            action: #selector(handle),
            for: .valueChanged
        )
    }
    
    @objc private func handle() {
        action?()
    }
}
