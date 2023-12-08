
public protocol AnyItemViewModel {
    var title: String { get }
    var representableIdentifier: String { get }
    func execute()
}
