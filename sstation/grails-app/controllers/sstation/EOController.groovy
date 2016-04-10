package sstation

import sstation.CampusOrg;
import sstation.CommAg;
import sstation.Event;
import sstation.ServiceHour;

class EOController {
	/*
	 * Methods about events
	 */
	/**
	 * The event main page
	 * @return
	 */
	def eventMain(){
		def list=Event.list()
		render view:"event/eventMain",model:[list:list]
	}

	/**
	 * Event list page
	 * @return
	 */
	def _eventTable(){
		def list=Event.list()

		render view:"event/_eventTable",model:[list:list]
	}

	/**
	 * KPI page about all events
	 * @return
	 */
	def _eventOverallKPI(){
	}

	/**
	 * KPI page about a single event
	 * @param e
	 * @return
	 */
	def _eventKPI(Event e){
		int year=Integer.parseInt(params.eventTime)
		println year
		render view:"event/_eventKPI"
	}


	/**
	 * Create a new event
	 * @return
	 */
	def _createEvent(){
		Event e=new Event()
		def heading="New Event"
		render view:"event/_eventForm",model:[event:e,heading:heading]
	}

	/**
	 * Edit a specific event
	 * @param e
	 * @return
	 */
	def _editEvent(Event e){
		def heading=e.name
		render view:"event/_eventForm",model:[event:e,heading:heading]
	}

	/**
	 * Save the edited/created event
	 * @param e
	 * @return
	 */
	def _saveEvent(Event e){
		e.properties=params
		e.save(flush:true,failOnError:true)
		_eventTable()
	}

	/**
	 * Delete a specific event
	 * @param e
	 * @return
	 */
	def _deleteEvent(Event e){
		ServiceHour.findAllByEvent(e).each{
			it.delete(flush:true,failOnError:true)
		}
		e.delete(flush:true,failOnError:true)
		_eventTable()
	}


	
	
	
	
	/*
	 * Methods about Campus Organizations
	 */
	def orgMain(){
		def list=CampusOrg.list()
		render view:"org/orgMain",model:[list:list]
	}
	
	def _orgList(){
		def list=CampusOrg.list()
		render view:"org/_orgList",model:[list:list]
	}
	
	def _createOrg(){
		CampusOrg org=new CampusOrg();
		def heading="New Campus Organization"
		render view:"org/_orgForm",model:[org:org,heading:heading]
	}
	
	def _editOrg(CampusOrg org){
		render view:"org/_orgForm",model:[org:org,heading:org.name]
	}
	
	def _saveOrgOnOA(CampusOrg org){
		org.properties=params
		org.save(flush:true,failOnError:true)
		orgAgMain()
	}
	
	def _saveOrgOnMain(CampusOrg org){
		org.properties=params
		org.save(flush:true,failOnError:true)
		orgMain()
	}
	
	def _deleteOrgOnOA(CampusOrg org){
		ServiceHour.findAllByCampusOrg(org).each{
			it.delete(flush:true,failOnError:true)
		}
		org.delete(flush:true,failOnError:true)
	}
	
	def _deleteOrgOnMain(CampusOrg org){
		ServiceHour.findAllByCampusOrg(org).each{
			it.delete(flush:true,failOnError:true)
		}
		org.delete(flush:true,failOnError:true)
		_orgList()
	}


	/**
	 * The main page for organization and agencies. Display 10 of each
	 * @return
	 */
	def orgAgMain(){
		def agList=CommAg.list()
		def orgList=CampusOrg.list()
		render view:"org/orgAgMain",model:[agList:agList,orgList:orgList]
	}

	/*
	 * Methods about community agencies
	 */
	/**
	 * Community Agency Main Page
	 * @return
	 */
	def agMain(){
		def list=CommAg.list()
		render view:"commAg/agMain",model:[list:list]
	}

	def _agTable(){
		def list=CommAg.list()
		render view:"commAg/_agTable",model:[list:list]
	}

	def _agOverallKPI(){

	}

	def _agKPI(){

	}

	def _createAgency(){
		CommAg ag=new CommAg()
		def heading="New Community Agency"
		render view:"commAg/_agForm",model:[agency:ag,heading:heading]
	}

	def _editAgency(CommAg ag){
		def heading=ag.name
		render view:"commAg/_agForm",model:[agency:ag,heading:heading]
	}

	def _saveAgencyToAgMain(CommAg agency){
		agency.properties=params
		agency.save(flush:true,failOnError:true)
		agMain()
	}
	
	def _saveAgencyToOA(CommAg agency){
		agency.properties=params
		agency.save(flush:true,failOnError:true)
		orgAgMain()
	}

	def _deleteAgencyOnMain(CommAg ag){
		ServiceHour.findAllByCommAg(ag).each{
			it.delete(flush:true,failOnError:true)
		}
		ag.delete(flush:true,failOnError:true)
		_agTable()
	}

	def _deleteAgencyOnOA(CommAg ag){
		ServiceHour.findAllByCommAg(ag).each{
			it.delete(flush:true,failOnError:true)
		}
		ag.delete(flush:true,failOnError:true)
		orgAgMain()
	}

	def _deleteMultAgency(){

	}
}
