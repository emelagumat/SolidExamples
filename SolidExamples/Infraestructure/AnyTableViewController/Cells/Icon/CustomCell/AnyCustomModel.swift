
final class AnyCustomModel: AnyIconViewModel {
    init() {
        super.init(
            title: "SOY CUSTOOM",
            representableIdentifier: String(describing: AnyCustomTableViewCell.self))
    }
    
    override func execute() {
        print("💛 Custom!")
    }
}
