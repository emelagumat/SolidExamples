
final class AnyCustomTableViewCell: AnyIconTableViewCell<AnyCustomModel> {
    override func configure(_ item: AnyCustomModel) {
        super.configure(item)
        contentView.backgroundColor = .red
    }
}
