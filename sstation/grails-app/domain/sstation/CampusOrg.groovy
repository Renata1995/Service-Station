package sstation

class CampusOrg {
	String name
	String description
	String contact
	String contactPhone
	String contactEmail
	
	
    static constraints = {
		contactEmail(email:true,blank:false,nullable:false)
		description(email:false,nullable:false,type:text)
		contact(blank:false,nullable:false)
		contactPhone(blank:false,nullable:false)
		name(blank:false,nullable:false)
    }
}
