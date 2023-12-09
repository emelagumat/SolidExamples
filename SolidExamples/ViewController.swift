
import UIKit
import App

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController = createTableVC()
        viewController.view.frame = view.frame
        viewController.willMove(toParent: self)
        view.addSubview(viewController.view)
        addChild(viewController)
    }
    
    private func createTableVC() -> AnyTableViewController {
        let coordinator = SpainCoordinator(viewController: self)
        
        let viewModel = AnyTableViewControllerViewModel(
            dataSource: SpainDataSource(coordinator: coordinator),
            coordinator: coordinator
        )
        let vc = AnyTableViewController(viewModel: viewModel)
        
        return vc
    }
}
