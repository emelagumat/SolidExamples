
import UIKit
import Domain

class AnyIconTableViewCell<Model: AnyIconViewModel>: AnyTableViewCell {
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
        var content = defaultContentConfiguration()
        content.text = item.title
        contentConfiguration = content
        
        let image = UIImage(systemName: "chevron.right")
        accessoryView = UIImageView(image: image)
        
        action = item.execute
        
        guard
            let item = item as? Model
        else { fatalError() }
        
       configure(item)
    }
    
    func configure(_ item: Model) {
    }
}
