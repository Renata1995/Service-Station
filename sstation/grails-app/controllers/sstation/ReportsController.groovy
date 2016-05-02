package sstation

class ReportsController {

    def index() { 
		def orgList=CommAg.list()
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
		println cbValue
	
//		def list=ServiceHour.list().findAll{
//			it.commAg.name==cbValue
//		}
		
		//Alt way of generating filtered list
		def commAg=CommAg.get(cbValue)
		println commAg
		def list=ServiceHour.findAllByCommAg(commAg)
		println list.size()
		[list:list]
	}
}