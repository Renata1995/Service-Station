package sstation
import java.text.SimpleDateFormat

import sstation.AcStudent;
import sstation.CampusOrg;
import sstation.CommAg;
import sstation.Event;
import sstation.ServiceHour;

class HourController {
	def hourService//Calculate all statistics about service hour list
	/*
	 * Methods about service hour management
	 */
	/**
	 * Main Page--Summary
	 * @return
	 */
	def overall(){
		def list=ServiceHour.list()
		[list:list]
	}

	/**
	 * Show the overall service hour kpi--Summary Page
	 * @return
	 */
	def _hourkpi(){
		return hourService.hourCall()
	}

	/**
	 * Shows the service hour table--Table
	 * @return
	 */
	def _totalHList(){
		def list=ServiceHour.list()
		[list:list]
	}

	/**
	 * Show the details of a specific service hour
	 * @param sh
	 * @return
	 */
	def shour(ServiceHour sh){
		[shour:sh]
	}
	
	/**
	 * Edit service hour page
	 */
	def _editShour(ServiceHour sh){
		def eventList=Event.list().collect{
			it.name
		}
		def orgList=CampusOrg.list().collect{
			it.name
		}
		def agList=CommAg.list().collect{
			it.name
		}
		[shour:sh,eventList:eventList,orgList:orgList,agList:agList]
		
	}

	/**
	 * Create a new service hour page
	 * @return
	 */
	def _createShour(){
		ServiceHour sh=new ServiceHour()
		def list=AcStudent.list()
		def nameList=[]
		AcStudent.list().each{
			nameList.add(it.firstname+" "+it.lastname)
		}
		def eventList=Event.list().collect{
			it.name
		}
		def orgList=CampusOrg.list().collect{
			it.name
		}
		def fullOrgList = CampusOrg.list()
		def fullAgList = CommAg.list()
		def agList=CommAg.list().collect{
			it.name
		}
		[eventList:eventList,orgList:orgList,fullOrgList:fullOrgList,agList:agList,fullAgList:fullAgList,shour:sh,list:list,nameList:nameList]
	}
	
	/**
	 * Used for saving a service hour in the totalhour page
	 * @param sh
	 * @return
	 */
	def saveShour(ServiceHour sh){
		println params
		sh.properties=params
		//Set the lastModified time
		sh.lastmodified=new Date()

		//Get the start date from the input
		SimpleDateFormat format=new SimpleDateFormat("MM/dd/yyyy")
		String d=params.startdate+" "+params.starthour+":"+params.startmin
		Date date = new Date().parse("MM/dd/yyyy HH:mm",d)
		sh.starttime=date
		sh.campusOrg=CampusOrg.findByName(params.shOrg)
		sh.event=Event.findByName(params.shEvent)
		sh.commAg=CommAg.findByName(params.shCommAg)
		sh.status=params.status;


		//Parse the id in the idList param and get corresponding students
		def id=Long.parseLong(params.studentIdHolder)
		def ac=AcStudent.get(id)
		println "student"+ac
		ac.addToServiceHours(sh).save(flush:true,failOnError:true)

		if( !sh.save(flush:true,failOnError:true) ) {
			sh.errors.each {
				println it
			}
		}
		println sh

		render view:"shour",model:[shour:sh]
	}

	def updateShour(ServiceHour sh){
		sh.properties=params
		//Set the lastModified time
		sh.properties=params
		sh.lastmodified=new Date()

		//Get the start date from the input
		SimpleDateFormat format=new SimpleDateFormat("MM/dd/yyyy")
		String d=params.startdate+" "+params.starthour+":"+params.startmin
		Date date = new Date().parse("MM/dd/yyyy HH:mm",d)
		sh.starttime=date
		
		//Save campus organization,event,community agency,and status
		sh.campusOrg=CampusOrg.findByName(params.shOrg)
		sh.event=Event.findByName(params.shEvent)
		sh.commAg=CommAg.findByName(params.shCommAg)
		sh.status=params.status;


		//Get the related student and save 
		def ac=sh.acStudent
		ac.addToServiceHours(sh).save(flush:true,failOnError:true)

		if( !sh.save(flush:true,failOnError:true) ) {
			sh.errors.each {
				println it
			}
		}
		render view:"shour",model:[shour:sh]
	}

	/**
	 * Delete the current service hour
	 * @param sh
	 * @return
	 */
	def deleteShour(ServiceHour sh){
		sh.delete (flush:true,failOnError:true)
		def list=ServiceHour.list()
		render view:"overall",model:[list:list]
		
	}


}
