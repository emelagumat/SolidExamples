
import Domain
import App
import UIKit

final class SpainDataSource: AnyDataSource {
    private let sections: [AnySection]
    
    init(coordinator: SpainCoordinator) {
        sections = Self.mock(coordinator)
    }
    
    private static func mock(_ coordinator: SpainCoordinator) -> [AnySection] {
        let items: [AnyItemViewModel] = (0...10).map { _ in
            if .random() {
                if .random() {
                    PasswordIconCellViewModel(coordinator: coordinator)
                } else {
                    if .random() {
                        SettingsIconCellViewModel(coordinator: coordinator)
                    } else {
                        AnyCustomModel()
                    }
                }
            } else {
                if .random() {
                    AnySwitchCellViewModel(
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
        
        return sections
    }
    
    func getSections() -> [Domain.AnySection] {
        sections
    }
    
    func getItem(atIndex: Int, inSection section: Int) -> AnyItemViewModel? {
        sections[section].items[atIndex] as? AnyItemViewModel
    }
    
    func getCellTypes() -> [UITableViewCell.Type] {
        [
            AnySwitchTableViewCell<AnySwitchCellViewModel>.self,
            AnyCustomTableViewCell.self,
            AnyPasswordTableViewCell.self,
            AnyIconTableViewCell<AnyIconViewModel>.self
        ]
    }
}

final class SpainCoordinator: DefaultAnyTableViewControllerCoordinator, PasswordCoordinator, SettingsCoordinator {
    func navigateToPassword() {
        print("💛 navigating to password")
    }
    
    func navigateToSettings() {
        print("💛 navigating to settings")
    }
}
