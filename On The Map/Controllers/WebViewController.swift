import UIKit

class WebViewController: UIViewController {
	@IBOutlet weak var webView: UIWebView!
	
	var url:URL?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if let url = url {
			let req = URLRequest(url: url)
			webView.loadRequest(req)
		} else {
			dismiss(animated: true, completion: {
				self.alert(title: "Failed", message: "Please try agian later")
			})
		}
	}
	@IBAction func cancel(_ sender: UIBarButtonItem) {
		dismiss(animated: true, completion: nil)
	}
	
	func alert(title: String = "", message: String = "") {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}
}
