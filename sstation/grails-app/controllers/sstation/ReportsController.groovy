package sstation

class ReportsController {
	def stationReportService
	
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
		def li = stationReportService.hourKPIbyEvent(e)
		render view:"eventReport", model:[list:li]
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
	
	def _hoursByEvent() {
		int eventId = Integer.parseInt(params.event)
//		def event = Event.get(eventId)
		def aList=ServiceHour.findAllByStatus(Status.APPROVED);
		def list=aList.findAll{
//			it.event.equals(event)
			it.event.id==eventId
		}
		render view:"_hoursByEvent",model:[list:list]
	}
	
	
}
