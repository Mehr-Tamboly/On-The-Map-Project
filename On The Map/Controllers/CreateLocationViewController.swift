import UIKit

class CreateLocationViewController: UIViewController {

	@IBOutlet weak var locationTextField: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	@IBAction func cancel(_ sender: AnyObject) {
		dismiss(animated: true, completion: nil)
	}
}
