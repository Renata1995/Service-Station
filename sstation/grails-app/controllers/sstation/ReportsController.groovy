package sstation

class ReportsController {
	def stationReportService

    def index() { 
		
	}
	
	def acGroupReport() {
		render "group report"
	}
	
	def eventReport(Event event) {
		def li = []
		
		
		def listService = ServiceHour.list();
		
		def eventReportService = new EventReportService(event, listService);
		for (Event e: Event.list()){
			def value = []
			value.add(e)
			value.add(eventReportService.getTotalHourByEvent(e))
			value.add(eventReportService.getListHourByEvent(e))
			li[e.id] = value
		}
		
		render view:"eventReport", model:[li:li]
		
		 
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
