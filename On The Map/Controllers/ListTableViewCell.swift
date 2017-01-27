import UIKit

class ListTableViewCell: UITableViewCell {
	@IBOutlet weak var pinImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var linkLabel: UILabel!

	var student: Student? {
		didSet {
			if let student = student {
				pinImageView.image = #imageLiteral(resourceName: "pin")
				nameLabel.text = student.fullName
				linkLabel.text = student.link
			}
		}
	}

}
