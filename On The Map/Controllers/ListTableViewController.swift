import UIKit

class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
	}
	
	@IBAction func refresh(_ sender: AnyObject) {
	}
	
	@IBAction func create(_ sender: AnyObject) {
		alertCreate()
	}
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)

        // Configure the cell...

        return cell
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
