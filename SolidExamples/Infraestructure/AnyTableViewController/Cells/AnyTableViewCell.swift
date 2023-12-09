
import UIKit
import App

open class AnyTableViewCell: UITableViewCell {
    var action: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        selectionStyle = .none
        
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        bindAction()
    }
    
    func bindAction() {
        assertionFailure("Must be implemented by subclass")
    }
    
    func configure(with item: AnyItemViewModel) {
        var content = defaultContentConfiguration()
        content.text = item.title
        content.textProperties.font = .boldSystemFont(ofSize: 32)
        content.textProperties.numberOfLines = .zero
        contentConfiguration = content
        action = item.execute
    }
}
