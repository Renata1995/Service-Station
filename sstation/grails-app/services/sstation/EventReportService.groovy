package sstation;

import java.util.ArrayList;

public class EventReportService {
//	def Event event
//	def serviceList = []
//	public EventReportService(Event e, serviceList){
//		this.event = event;
//		this.serviceList = serviceList;
//		
//	}
//	

//	
//	def getTotalHourByEvent(Event e){
//		def totalHour = 0;
//		def li = [];
//		
//		for (ServiceHour s: serviceList){
//			if (s.event.equals(this.event)){
//				li.add(s);
//			}
//		}
//		for (ServiceHour s: li){
//			totalHour += s.duration;
//		}
//		
//		return totalHour;
//	}
//	
//	/*
//	 * Get the list of all service hour
//	 */
//	def getListHourByEvent(Event e){
//		def li = []
//		
//		for (ServiceHour s: serviceList){
//			if (s.event.equals(this.event)){
//				li.add(s);
//			}
//		}
//		return li
//	}
//	
//	
//	
	
	
	/**
	 * Calculate hour kpi for a specific event
	 */
	def hourKPIbyEvent(Event event){
		//All APPROVED hours
		def alist=ServiceHour.findAllByStatus(Status.APPROVED)
		
		//All APPROVED hours for an event
		def totalList=alist.findAll{
			it.event.equals(event);
		}
		
		//The sum of durations of all service hours in totalList
		double total=0
		if(totalList.size()!=0) total=totalList.duration.sum()
		
		//Diverse Averages
		double avgByStudent=0
		if(AcStudent.count()!=0) avgByStudent=(total/AcStudent.count()).round(2)
			
		double avgByGroup=0
		if(CampusOrg.count()!=0) avgByGroup=(total/CampusOrg.count()).round(2)
		
		double avgByCommOrg=0
		if(CommAg.count()!=0) avgByCommOrg=(total/CommAg.count()).round(2)
		
		double avgByEvent=0
		if(Event.count()!=0) avgByEvent=(total/Event.count()).round(2)
		
		
		[event:event,total:total,avgByStudent:avgByStudent,avgByGroup:avgByGroup,avgByCommOrg:avgByCommOrg,avgByEvent:avgByEvent]
	}
	
}
