
import App

protocol PasswordCoordinator: AnyTableViewControllerCoordinator {
    func navigateToPassword()
}

protocol SettingsCoordinator: AnyTableViewControllerCoordinator {
    func navigateToSettings()
}
