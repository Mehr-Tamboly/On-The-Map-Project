import UIKit
import MapKit

class MapViewController: UIViewController {
	@IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
	@IBAction func refresh(_ sender: AnyObject) {
	}
	
	@IBAction func create(_ sender: AnyObject) {
		alertCreate()
	}
	
	func alertCreate(){
		let alert = UIAlertController(title: GeneralLibrary.Alerts.OverwriteTitle, message: GeneralLibrary.Alerts.OverwriteMessage, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: GeneralLibrary.AlertActions.Overwrite, style: .destructive, handler: { void in
			self.goToCreatePin()
		}))
		alert.addAction(UIAlertAction(title: GeneralLibrary.AlertActions.Cancel, style: .cancel, handler: nil))
		present(alert, animated: true, completion: nil)
	}
	
	func goToCreatePin(){
		let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
		if let VC = storyboard.instantiateViewController(withIdentifier: "CreateLocationViewController") as? CreateLocationViewController {
			let navVC = UINavigationController(rootViewController: VC)
			
			VC.navigationController?.title = "Create Pin"
			present(navVC, animated: true, completion: nil)
		}
	}
	
}
