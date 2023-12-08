
import UIKit

public protocol AnyTableViewControllerCoordinator {
    // Common methods
    func showAlert(text: String, enabled: Bool)
}

open class DefaultAnyTableViewControllerCoordinator: AnyTableViewControllerCoordinator {
    public let viewController: UIViewController
    
    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func showAlert(text: String, enabled: Bool) {
        let action = UIAlertAction(title: "Ok", style: .destructive)
        let alert = UIAlertController(
            title: text,
            message: "\(enabled)",
            preferredStyle: .alert
        )
        alert.addAction(action)
        
        viewController.present(
            alert,
            animated: true
        )
    }
}
