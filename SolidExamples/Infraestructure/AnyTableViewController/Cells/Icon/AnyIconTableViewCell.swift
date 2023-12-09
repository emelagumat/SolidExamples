
import UIKit
import App

class AnyIconTableViewCell<Model: AnyIconViewModel>: AnyTableViewCell {
    override func bindAction() {
        isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        addGestureRecognizer(recognizer)
    }
    
    @objc private func onTap() {
        action?()
    }
    
    override func configure(with item: AnyItemViewModel) {
        super.configure(with: item)
        
        let image = UIImage(systemName: "chevron.right")
        accessoryView = UIImageView(image: image)
        accessoryView?.tintColor = .darkGray
        guard
            let item = item as? Model
        else { fatalError() }
        
       configure(item)
    }
    
    func configure(_ item: Model) {
        
    }
}
