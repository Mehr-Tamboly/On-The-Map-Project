import UIKit
import MapKit

class CreateLinkViewController: UIViewController {

	@IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var linkTextField: UITextField!
	
	var location: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }

	@IBAction func submit(_ sender: AnyObject) {
	
	}
	
	@IBAction func cancel(_ sender: AnyObject) {
		dismiss(animated: true, completion: nil)
	}
}
