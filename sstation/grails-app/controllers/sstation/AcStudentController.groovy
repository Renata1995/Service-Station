package sstation


/**
 * AcStudent controller management the student list section. It has several functions
 * 1. Editing, creating, deleting student
 * 2. Editing, creating, deleting service hours for a specific student
 * 
 *  Domain 1 is admin and domain 2 is student.
 *  Only admin can change the status of the servicehour
 *  
 */
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import java.text.SimpleDateFormat
import java.util.Date

import sstation.AcStudent;
import sstation.CampusOrg;
import sstation.CommAg;
import sstation.Event;
import sstation.ServiceHour;
import sstation.Status;

class AcStudentController {
	def hourService//Calculate all statistics about service hour list
	def reportService//Used for report pages


	/*
	 * Basic Pages
	 */
	/**
	 * Basic Pages:Log in and sign up
	 * @return
	 */	
	def index(){}//log In + Sign Up


	/**
	 * Render the main home page for either a student or an admin member
	 * @return
	 */
	def dashboard(){//dashboard Home page
		int domain=Integer.parseInt(params.domain)
		def map=hourService.hourCall()//prepare data for the statistic diagrams on the home page
		map<<[domain:domain]
		
		def shList=ServiceHour.findAllByStatus(Status.PENDING)
		def list=shList[0..4]
		map<<[list:list]
		render view:"dashboard", model:map
	}









	/*
	 * Methods about student management
	 */


	/**
	 * Main Page
	 * @return
	 */
	def studentList() {
		def list=AcStudent.list()   //Prepare the student list
		render view:"student/studentList",model:[list:list]//Map and return the student list
	}

	/**
	 * Student Table
	 */
	def _sTable(){
		def list=AcStudent.list()   //Prepare the student list
		render view:"student/_sTable", model:[list:list]//Map and return the student list
	}


	/**
	 * Not used yet
	 * Report overall statistics about all students and their service hours
	 * @return
	 */
	def _studentOverallKPI(){
		render view:"kpi/_studentOverallKPI"
	}


	/**
	 * This page is the main page for the current student. 
	 * @param student  passed from the _studentList.gsp
	 */
	def student(AcStudent student) {
		render view:"student/student",model:[student:student]
	}

	/**
	 * Show the details information about the current student
	 * @param student passed from the _student.gsp
	 * @return
	 */
	def _showStudent(AcStudent student){
		render view:"student/_showStudent",model:[student:student]
	}


	/**
	 * KPI about a specific student
	 * @param student
	 * @return
	 */
	def _studentKPI(AcStudent student){
		render view:"student/_studentKPI",model:[student:student]
	}


	/**
	 * Render the create student page. The newly created AcStudent object is decleared in the gsp page
	 * @return
	 */
	def _createStudent(){
		AcStudent student=new AcStudent()
		render view:"student/_createStudent",model:[student:student]
	}


	/**
	 * Edit the current student. 
	 * @param student  passed from the _student.gsp
	 * @return
	 */
	def _editStudent(AcStudent student){
		render view:"student/_editStudent",model:[student:student]
	}



	/**
	 * This method will save the change the user make on the create or edit dialog
	 * @param student
	 * @return
	 */

	def saveStudent(AcStudent student) {

		/*if (student == null) {
		 notFound()
		 return
		 }*/

		/*if (student.hasErrors()) {
		 println "error"
		 respond student.errors, view:'_studentList'
		 return
		 }*/
		student.properties=params
		student.save(flush:true,failOnError:true)
		render view:"student/student",model:[student:student]

	}

	/**
	 * Update changed student after editing.
	 * @param student 
	 * @return
	 */
	def _updateStudent(AcStudent student) {
		/*if (student == null) {
		 println("null")
		 notFound()
		 return
		 }
		 */
		if (student.hasErrors()) {
			println("error")
			respond student.errors, view:'_editStudent'
			return
		}

		student.save flush:true
		render(view:"student/_showStudent",model:[student:student])

	}


	/**
	 * Delete the current student
	 * @param student
	 * @return
	 */
	def deleteStudent(AcStudent student) {

		if (student == null) {
			notFound()
			return
		}

		student.delete flush:true
		def myStudent=AcStudent.list()
		render view:"student/_sTable", model:[list:myStudent]
	}

	/**
	 * Delete multiple selected students
	 * @return
	 */
	def deletemult(){
		def list=[];
		println params.checkstudent
		params.checkstudent.each{
			def id=Long.parseLong(it)
			AcStudent.get(id).delete flush:true
		}
		render view:"student/studentList", model:[list:AcStudent.list()]




	}

	/**
	 * When the specific acStudent object is not found, this method is used.
	 */
	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'acStudent.label', default: 'AcStudent'), params.id])
				redirect action: "student/_studentList", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}






	/*
	 * Methods about service hours in a specific student
	 */
	/**
	 * Display the service hour list of a specific student
	 * @param student
	 * @return
	 */
	def _hourList(AcStudent student){
		def stat=hourService.studentStat(student)
		def list=student.serviceHours
		render view:"shour/_hourList",model:[student:student,stat:stat,list:list]
	}

	/**
	 * Update the status of the current service hour. Only admin could access this function
	 */
	def updateStatus(){
		int shid=Integer.parseInt(params.shid)
		def sh=ServiceHour.get(shid)
		sh.status=params.statusChange;
		sh.save flush:true,failOnError:true

		def student=sh.acStudent;
		_hourList(student)
	}

	/**
	 * Show the current service hour
	 * @param sh
	 * @return
	 */
	def shour(ServiceHour sh){
		render view:"shour/shour",model:[shour:sh]
	}
	/**
	 * Create a new service hour
	 * @param ac:the AcStudent that the new service hour will belong to
	 * @return
	 */
	def _createShour(AcStudent ac){
		def list=AcStudent.list()
		def shour=new ServiceHour()
		def eventList=Event.list().collect{
			it.name
		}
		def orgList=CampusOrg.list().collect{
			it.name
		}
		def agList=CommAg.list().collect{
			it.name
		}
		render view:"shour/_createShour",model:[shour:shour,acid:ac.id,list:list,eventList:eventList,orgList:orgList,agList:agList]
	}
	/**
	 * Edit the current service hour
	 * @param sh
	 * @return
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
		render view:"shour/_editShour",model:[shour:sh,eventList:eventList,orgList:orgList,agList:agList]
	}

	/**
	 * Save the current servicehour
	 * @param sh
	 * @return
	 */
	def saveShour(ServiceHour sh){
		//Set the lastModified time
		sh.properties=params
		sh.lastmodified=new Date()

		//Get the start date from the input
		SimpleDateFormat format=new SimpleDateFormat("MM/dd/yyyy")
		String d=params.startdate+" "+params.starthour+":"+params.startmin
		Date date = new Date().parse("MM/dd/yyyy HH:mm",d)
		sh.starttime=date
		sh.campusOrg=CampusOrg.findByName(params.shOrg)
		sh.event=Event.findByName(params.shEvent)
		sh.commAg=CommAg.findByName(params.shCommAg)
		if(params.doamin=="2"){
			//If a student add a new service hour, the status of this service hour is pending
			sh.status="Pending"

		}else{
			//If an admin user add a new service hour, the status is the one he/she input
			sh.status=params.status;
		}


		def ac=AcStudent.get(params.acid)
		ac.addToServiceHours(sh).save(flush:true,failOnError:true)

		if( !sh.save(flush:true,failOnError:true) ) {
			sh.errors.each {
				println it
			}
		}
		render view:"shour/shour",model:[shour:sh]

	}
	
	/**
	 * Delete the current service hour
	 * @param sh
	 * @return
	 */
	def deleteShour(ServiceHour sh){
		println sh;
		AcStudent ac=sh.acStudent
		sh.delete flush:true
		student(ac)
		
	}
	
	

	/*
	 *Report Methods 
	 */

	/**
	 * Admin access only. Show three different ways to report the service hours of a specific student
	 * @param ac
	 * @return
	 */
	def _reportAdmin(AcStudent ac){
		render view:"report/_reportAdmin",model:[student:ac]
	}

	/**
	 * Show a report page about service hours of a specific student
	 */
	def _studentReport(AcStudent ac){
		def list=ac.serviceHours.toList().findAll{
			it.status==Status.APPROVED
		}
		def totalSH=hourService.studentStat(ac).get('aSum')
		render view:"report/_studentReport",model:[student:ac,list:list,totalSH:totalSH]
	}

	/**
	 * Show a report page about service hours by semester of a specific student 
	 */
	def _semesterReport(AcStudent ac){
		def SHlist=reportService.semesterReport(ac)
		def totalSH=hourService.studentStat(ac).get('aSum')
		render view:"report/_semesterReport",model:[student:ac,SHlist:SHlist,totalSH:totalSH]
	}

	def _orgReport(AcStudent ac){
		def list=reportService.orgReport(ac)
		println list
		def totalSH=hourService.studentStat(ac).get('aSum')
		render view:"report/_orgReport",model:[student:ac,list:list,totalSH:totalSH]
	}





}