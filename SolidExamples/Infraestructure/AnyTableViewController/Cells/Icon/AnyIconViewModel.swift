
import App

class AnyIconViewModel: AnyItemViewModel {
    let title: String
    let representableIdentifier: String
    
    init(title: String, representableIdentifier: String) {
        self.title = title
        self.representableIdentifier = representableIdentifier
    }
    
    func execute() {
        assertionFailure("Must be implemented by subclass")
    }
}
