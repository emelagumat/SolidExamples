//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController = UIViewController()
        viewController.view.frame = view.frame
        viewController.view.backgroundColor = .red
        viewController.willMove(toParent: self)
        view.addSubview(viewController.view)
        addChild(viewController)
    }


}

