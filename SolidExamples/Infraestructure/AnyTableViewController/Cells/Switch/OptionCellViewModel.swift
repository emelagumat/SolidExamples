
import Domain
import App

class OptionCellViewModel: AnyItemViewModel {
    let coordinator: AnyTableViewControllerCoordinator
    
    let title: String
    let representableIdentifier: String
    var isEnabled = false
    
    init(title: String, coordinator: PasswordCoordinator) {
        self.coordinator = coordinator
        self.title = title
        self.representableIdentifier = String(describing: AnySwitchTableViewCell.self)
    }
    
    func execute() {
        isEnabled.toggle()
        
        coordinator.showAlert(
            text: title,
            enabled: isEnabled
        )
    }
}

final class HappyOptionCellViewModel: OptionCellViewModel {
    init(coordinator: PasswordCoordinator) {
        super.init(
            title: "Are you happy",
            coordinator: coordinator
        )
    }
}
