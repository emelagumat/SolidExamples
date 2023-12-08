
import UIKit
import Domain
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
        let coordinator = SpainCoordinatorImpl(viewController: self)
        
        let viewModel = AnyTableViewControllerViewModel(
            dataSource: SpainDataSource(coordinator: coordinator),
            coordinator: coordinator
        )
        let vc = AnyTableViewController(viewModel: viewModel)
        
        return vc
    }
}

private final class SpainDataSource: AnyDataSource {
    private let sections: [AnySection]
    
    init(coordinator: ValidCoordinator) {
        let items: [AnyItemViewModel] = (0...10).map { _ in
            if .random() {
                if .random() {
                    PasswordIconCellViewModel(coordinator: coordinator)
                } else {
                    SettingsIconCellViewModel(coordinator: coordinator)
                }
            } else {
                if .random() {
                    OptionCellViewModel(
                        title: String((0..<10).map{ _ in "abcdefghijklmnopqrstuvwxyz".randomElement()! }),
                        coordinator: coordinator
                    )
                } else {
                    HappyOptionCellViewModel(coordinator: coordinator)
                }
            }
        }
        let sections = (0...3).map { index in
            DefaultAnySection(
                title: "Section \(index)",
                items: items
            )
        }
        
        self.sections = sections
    }
    
    func getSections() -> [Domain.AnySection] {
        sections
    }
    
    func getItem(atIndex: Int, inSection section: Int) -> Domain.AnyItemViewModel? {
        sections[section].items[atIndex]
    }
}

private final class SpainCoordinatorImpl: DefaultAnyTableViewControllerCoordinator, PasswordCoordinator, SettingsCoordinator {
    func navigateToPassword() {
        print("💛 navigating to password")
    }
    
    func navigateToSettings() {
        print("💛 navigating to settings")
    }
}
