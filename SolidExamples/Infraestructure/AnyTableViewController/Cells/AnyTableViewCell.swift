
import UIKit
import Combine
import Domain

open class AnyTableViewCell: UITableViewCell {
    let actionSubject = PassthroughSubject<Void, Never>()
    var cancellables = Set<AnyCancellable>()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
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
        assertionFailure("Must be implemented by subclass")
    }
}

extension AnyTableViewCell {
    var onAction: AnyPublisher<Void, Never> {
        actionSubject.eraseToAnyPublisher()
    }
}
