package sstation;

import java.util.ArrayList;

public class EventReportService {
	def Event event
	def serviceList = []
	public EventReportService(Event e, serviceList){
		this.event = event;
		this.serviceList = serviceList;
		
	}
	

	
	def getTotalHourByEvent(Event e){
		def totalHour = 0;
		def li = [];
		
		for (ServiceHour s: serviceList){
			if (s.event.equals(this.event)){
				li.add(s);
			}
		}
		for (ServiceHour s: li){
			totalHour += s.duration;
		}
		
		return totalHour;
	}
	
	/*
	 * Get the list of all service hour
	 */
	def getListHourByEvent(Event e){
		def li = []
		
		for (ServiceHour s: serviceList){
			if (s.event.equals(this.event)){
				li.add(s);
			}
		}
		return li
	}
	
	
}
