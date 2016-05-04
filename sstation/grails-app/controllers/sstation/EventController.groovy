package sstation

import sstation.CampusOrg;
import sstation.CommAg;
import sstation.Event;
import sstation.ServiceHour;

import grails.transaction.Transactional
import java.security.MessageDigest
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_MODERATOR'])
@Transactional(readOnly = false)

class EventController {
	/*
	 * Methods about events
	 */
	/**
	 * The event main page
	 * @return
	 */
	def eventMain(){
		def list=Event.list()
		render view:"eventMain",model:[list:list]
	}

	/**
	 * Event list page
	 * @return
	 */
	def _eventTable(){
		def list=Event.list()

		render view:"_eventTable",model:[list:list]
	}
	
	def _eventTableView(){
		def list=Event.list()

		render view:"_eventTableView",model:[list:list]
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
		render view:"_eventKPI"
	}


	/**
	 * Create a new event
	 * @return
	 */
	def _createEvent(){
		Event e=new Event()
		def heading="New Event"
		render view:"_eventForm",model:[event:e,heading:heading]
	}

	/**
	 * Edit a specific event
	 * @param e
	 * @return
	 */
	def _editEvent(Event e){
		def heading=e.name
		render view:"_eventForm",model:[event:e,heading:heading]
	}

	/**
	 * Save the edited/created event
	 * @param e
	 * @return
	 */
	def _saveEvent(Event e){
		e.properties=params
		if(!e.save(flush:true,failOnError:true)){
			render view:'_eventForm', model:[event:e]
			return
		}
		e.save(flush:true,failOnError:true)
		def list=Event.list()
		render view:"eventMain",model:[list:list]
		//_eventTable()
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
}
