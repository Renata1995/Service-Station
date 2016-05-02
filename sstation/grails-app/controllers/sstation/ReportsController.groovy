package sstation

class ReportsController {
	def stationReportService

    def index() { 
		def orgList=CommAg.list()
		def semesterList = ["Fall", "Janterm", "Spring", "Summer"]
		
		int currentYear=new Date().getAt(Calendar.YEAR)
		def yearList = []
		for(int a=currentYear; a > currentYear-5; a--){
			yearList.add(a)
		}
		[orgList:orgList, semesterList:semesterList, yearList:yearList]
	}
	
	def acGroupReport() {
		render "group report"
	}
	
	def eventReport(Event e) {
		def li = stationReportService.hourKPIbyEvent(e)
		render view:"eventReport", model:[list:li]
	}
	
	def eventSelection() {
		def li = Event.list()
		render view:"eventSelection", model:[list:li]
	}
	
	def _hoursByEvent() {
		int eventId = Integer.parseInt(params.event)
		def aList=ServiceHour.findAllByStatus(Status.APPROVED);
		def list=aList.findAll{
			it.event.id==eventId
		}
		render view:"_hoursByEvent",model:[list:list]
	}
	
	def summaryReport(){
		def constant = 5;
		def year = 2016;
		def totalHours = 0;
		

		def allHours = ServiceHour.list();
		def allAgs = CommAg.list();
		def allOrgs = CampusOrg.list();
		def allEvs = Event.list();
		
		def topAgs = [];
		def topEvs = [];
		def topOrgs = [];
		
		def agHours = [];
		def evHours = [];
		def orgHours = [];
		for (int i = 0; i<constant; i++){
			
			topAgs.add(allAgs.get(i));
			topEvs.add(allEvs.get(i));
			topOrgs.add(allOrgs.get(i));
			
			CommAgReportService agService = new CommAgReportService(allAgs.get(i), allHours);
			CampusOrgReportService orgService = new CampusOrgReportService(allOrgs.get(i), allHours);
			EventReportService evService = new EventReportService(allEvs.get(i), allHours);
			
			agHours.add(agService.getTotalHourByYear(year))
			evHours.add(evService.getTotalHourByYear(year))
			orgHours.add(orgService.getTotalHourByYear(year))
		}
		for (int i = 0; i<allHours.size;i++){
			def Calendar cal = Calendar.getInstance()
			cal.setTime(allHours.get(i).starttime)
			if(cal.get(Calendar.YEAR) == year){
				totalHours += allHours.get(i).duration
			}
		}
		
		
		render view:"summaryReport", model: [totalHours:totalHours ,constant:constant, topAgs:topAgs, allHours:allHours, topOrgs:topOrgs, topEvs:topEvs, agHours:agHours, evHours:evHours, orgHours:orgHours]
		
		
	
	}
	
	def semesterReport() {
		def semesterValue = params.semesterComboBox
		
		def yearValue = params.yearComboBox
		println yearValue +" "+ semesterValue
		def list = []
		def servList = ServiceHour.list()
		def yearList = servList.findAll{
			it.starttime.getAt(Calendar.YEAR)==Integer.parseInt(yearValue)
		}
		println yearList.size()
		switch (semesterValue){
			case "Fall": list=yearList.findAll{ it.starttime.getAt(Calendar.MONTH)>=8&&it.starttime.getAt(Calendar.MONTH)<=11 }
			break;
			case "Janterm": list=yearList.findAll{ it.starttime.getAt(Calendar.MONTH)==0 }
			break;
			case "Spring": list=yearList.findAll{it.starttime.getAt(Calendar.MONTH)>=1&&it.starttime.getAt(Calendar.MONTH)<=4 }
			break;
			case "Summer": list=yearList.findAll{ it.starttime.getAt(Calendar.MONTH)>=5&&it.starttime.getAt(Calendar.MONTH)<=7 }
			break;
		}
		println list.size()
		
		
		
		
		
		[list:list]
	}
	
	def commOrgReport() {
		def cbValue = params.commOrgComboBox
		//
	
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
