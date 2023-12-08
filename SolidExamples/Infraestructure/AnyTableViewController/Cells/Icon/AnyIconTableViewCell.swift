
import UIKit
import Domain

class AnyIconTableViewCell: AnyTableViewCell {
    var action: (() -> ())?
    
    override func bindAction() {
        isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        addGestureRecognizer(recognizer)
    }
    
    @objc private func onTap() {
        action?()
    }
    
    override func configure(with item: AnyItemViewModel) {
        guard
            let item = item as? AnyIconViewModel
        else { fatalError() }
        
        var content = defaultContentConfiguration()
        content.text = item.title
        contentConfiguration = content
        
        let image = UIImage(systemName: "chevron.right")
        accessoryView = UIImageView(image: image)
        
        action = item.execute
    }
}
