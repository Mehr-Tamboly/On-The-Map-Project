struct Student {
	let uniqueKey: String
	let firstName: String
	let lastName: String
	var link: String
	var fullName: String {
		return "\(firstName) \(lastName)"
	}
	
	init(uniqueKey: String, firstName: String, lastName: String, link: String) {
		self.uniqueKey = uniqueKey
		self.firstName = firstName
		self.lastName = lastName
		self.link = link
	}
}
