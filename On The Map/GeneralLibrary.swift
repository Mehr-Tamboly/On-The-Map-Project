struct GeneralLibrary {
	
	// MARK: Alerts
	struct Alerts {
		static let OverwriteTitle = "Overwrite Location?"
		static let OverwriteMessage = "You've already posted a pin. Would you like to overwrite it?"
		static let LoginTitle = "Login Error"
	}
	
	// MARK: AlertActions
	struct AlertActions {
		static let Overwrite = "Overwrite"
		static let Cancel = "Cancel"
		static let Dismiss = "Dismiss"
	}
	
	// MARK: Errors
	struct Errors {
		static let UserPassEmpty = "Username or password empty."
		static let URLEmpty = "Must enter a URL."
		static let StudentAndPlacemarkEmpty = "Student and placemark not initialized."
		static let MapStringEmpty = "Must enter a Location."
		static let CouldNotGeocode = "Could not geocode the string."
		static let NoLocationFound = "No location found."
		static let PostStudentLocationFailed = "Student location could not be posted."
		static let CannotOpenURL = "Cannot open URL."
		static let CouldNotUpdateStudentLocations = "Could not update student locations."
	}
}
