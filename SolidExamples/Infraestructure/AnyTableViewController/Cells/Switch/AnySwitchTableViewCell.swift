
import UIKit
import Combine
import Domain

class AnySwitchTableViewCell: AnyTableViewCell {
    lazy var toggle = UISwitch()
    private var execute: (() -> ())?
    
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
    
    override func configure(with item: AnyItemViewModel) {
        guard
            let item = item as? OptionCellViewModel
        else { fatalError() }
        
        var content = defaultContentConfiguration()
        content.text = item.title
        contentConfiguration = content
        
        execute = item.execute
    }
    
    @objc private func handle() {
        execute?()
    }
}
