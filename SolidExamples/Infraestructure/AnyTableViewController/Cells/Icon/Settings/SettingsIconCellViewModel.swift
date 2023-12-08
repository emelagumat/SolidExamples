
import Domain

final class SettingsIconCellViewModel: AnyIconViewModel {
    let coordinator: SettingsCoordinator
    
    init(coordinator: SettingsCoordinator) {
        self.coordinator = coordinator
        
        super.init(
            title: "Settings",
            representableIdentifier: String(describing: AnyIconTableViewCell.self)
        )
    }
    
    override func execute() {
        coordinator.navigateToSettings()
    }
}
