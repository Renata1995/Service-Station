package sstation

class ReportsController {

    def index() { 
		def orgList=CampusOrg.list()
		[orgList:orgList]
	}
	
	def acGroupReport() {
		render "group report"
	}
	
	def eventReport() {
		render "event report"
	}
	
	def semesterReport() {
		render "semester report"
	}
	
	def commOrgReport() {
		def cbValue = params.commOrgComboBox
		def filteredServiceHour = []
		int counter = 0
		ServiceHour.list().each{
			if (it.commAg == cbValue.minus("\"")){
				filteredServiceHour[counter] = it
				counter ++
			}
		}
		[filteredServiceHour:filteredServiceHour]
	}
}