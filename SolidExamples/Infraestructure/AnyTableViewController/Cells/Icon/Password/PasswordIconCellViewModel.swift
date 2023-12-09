
final class PasswordIconCellViewModel: AnyIconViewModel {
    let coordinator: PasswordCoordinator
    
    init(coordinator: PasswordCoordinator) {
        self.coordinator = coordinator
        
        super.init(
            title: "Password",
            representableIdentifier: String(describing: AnyPasswordTableViewCell.self)
        )
    }
    
    override func execute() {
        coordinator.navigateToPassword()
    }
}
