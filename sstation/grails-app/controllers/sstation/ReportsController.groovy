package sstation

class ReportsController {

    def index() { 
		
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
		render "comm org report"
	}
}