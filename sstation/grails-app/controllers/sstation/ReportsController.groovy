package sstation

class ReportsController {
	def stationReportService
	def eventReportService
	
    def index() { 
		
	}
	
	def acGroupReport() {
		render "group report"
	}
	
	def eventSelection() {
		def li = Event.list()
		render view:"eventSelection", model:[list:li]
	}
	
	def eventReport(Event e){
		render "hello World"
	}
	
	def semesterReport() {
		render "semester report"
	}
	
	def commOrgReport() {
		render "comm org report"
	}
	
	def yearReport(){
		render view:"yearReport",model:[list:stationReportService.hourKPIInFiveYear()]
	}
	
	def _hoursByYear(){
		int year=Integer.parseInt(params.year)
		def aList=ServiceHour.findAllByStatus(Status.APPROVED);
		def list=aList.findAll{
			it.starttime.getAt(Calendar.YEAR)==year
		}
		render view:"_hoursByYear",model:[list:list]
	}
	
	
}
