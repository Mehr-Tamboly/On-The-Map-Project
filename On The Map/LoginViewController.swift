import UIKit

class LoginViewController: UIViewController {
	@IBOutlet weak var emailTF: UITextField!
	@IBOutlet weak var passwordTF: UITextField!
	
	var tapRecognizer: UITapGestureRecognizer?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		set(textField: emailTF, isSecure: false)
		set(textField: passwordTF, isSecure: true)
		
		tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleSingleTap(_:)))
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		subscribeToKeyboardNotifications()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		unsubscribeFromKeyboardNotifications()
	}

	@IBAction func login(_ sender: UIButton) {
		performLogin()
	}
	
	@IBAction func signup(_ sender: UIButton) {
		performRegister()
	}
	
	func performLogin(){
		
	}
	
	func performRegister(){
		let urlString = "https://www.udacity.com/account/auth#!/signup"
		let url = URL(string: urlString)
		
		let storyboard = UIStoryboard.init(name: "Account", bundle: nil)
		if let VC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
			let navVC = UINavigationController(rootViewController: VC)
			
			VC.url = url
			VC.navigationController?.title = "Register"
			// TODO: handle auto login if possible
			present(navVC, animated: true, completion: nil)
		}
	}
}

// MARK: Display Message or indicator
extension LoginViewController {
	func indicator(){
		
	}
	
	func alert(title: String = "", message: String = "") {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}
}

// MARK: Set up for TextField
extension LoginViewController: UITextFieldDelegate {
	func set(textField: UITextField, isSecure: Bool){
		textField.delegate = self
		textField.isSecureTextEntry = isSecure
	}
	
	func handleSingleTap(_ recognizer: UITapGestureRecognizer) {
		self.view.endEditing(true)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case emailTF:
			passwordTF.becomeFirstResponder()
			break
		case passwordTF:
			performLogin()
			break
		default:
			textField.resignFirstResponder()
		}
		
		return true
	}
	
	func keyboardWillShow(_ notification: Notification) {
		if UIDevice.current.orientation.isLandscape {
			view.frame.origin.y = getKeyboardHeight(notification) * -1
		}
	}
	
	func keyboardWillHide(_ notification: Notification) {
		view.frame.origin.y = 0
	}
	
	func getKeyboardHeight(_ notification: Notification) -> CGFloat {
		let userInfo = (notification as NSNotification).userInfo
		let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
		return keyboardSize.cgRectValue.height
	}
	
	func subscribeToKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
		view.addGestureRecognizer(tapRecognizer!)
	}
	
	func unsubscribeFromKeyboardNotifications() {
		NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
		view.removeGestureRecognizer(tapRecognizer!)
	}
}

