package sstation


import grails.transaction.Transactional
import java.security.MessageDigest
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = false)

class CommOrgController {

	/*
	 * Methods about community agencies
	 */
	/**
	 * Community Agency Main Page
	 * @return
	 */
	def index(){
		def list=CommAg.list()
		render view:"index",model:[list:list]
	}

	def _agTable(){
		def list=CommAg.list()
		render view:"_agTable",model:[list:list]
	}

	def _agCard(){
		def list=CommAg.list()
		render view:"_agCard",model:[list:list]
	}

	def _createAgency(){
		redirect action: 'agForm'
	}

	def agForm(){
		CommAg ag=new CommAg()
		def heading="New Community Agency"
		render view:"agForm", model:[agency:ag,heading:heading]
	}

	def _editAgency(CommAg ag){
		def heading=ag.name
		render view:"agForm",model:[agency:ag,heading:heading]
	}

	/**
	 * Save or update an agency and direct to the saved page
	 * it needs to have an intermediary page so that on refresh
	 * it doesn't duplicate things
	 * don't mess with these
	 * @param agency
	 * @return
	 */
	def _saveOnCard(CommAg agency){
		agency.properties=params
		if (!agency.save(flush:true)) {
			render view:'agForm', model:[agency:agency,form:1,card:1]
			return
		}

		agency.save(flush:true,failOnError:true)
		
		render view:'formSaved',model:[card:1]
	}

	/**
	 * Save or update an agency and direct to the saved page
	 * it needs to have an intermediary page so that on refresh
	 * it doesn't duplicate things
	 * don't mess with these
	 * @param agency
	 * @return
	 */
	def _saveOnTable(CommAg agency){

		agency.properties=params
		if (!agency.save(flush:true)) {
			render view:'agForm',model:[agency:agency,form:1,table:1]
			return
		}

		
		render view:'formSaved',model:[table:1]
	}

	def returnToTable(){
		def list=CommAg.list()
		render view:'index',model:[list:list,table:1]
	}

	def returnToCard(){
		def list=CommAg.list()
		render view:'index',model:[list:list,card:1]
	}


	/**
	 * Delete an agency and direct to the table view
	 * @param agency
	 * @return
	 */
	def _deleteOnTable(CommAg ag){
		ServiceHour.findAllByCommAg(ag).each{
			it.delete(flush:true,failOnError:true)
		}
		ag.delete(flush:true,failOnError:true)
		_agTable()
	}

	/**
	 * Delete an agency and direct to the card view
	 * @param agency
	 * @return
	 */
	def _deleteOnCard(CommAg ag){
		ServiceHour.findAllByCommAg(ag).each{
			it.delete(flush:true,failOnError:true)
		}
		ag.delete(flush:true,failOnError:true)
		def list=CommAg.list()
		render view:"_agCard",model:[list:list]
	}

	def _deleteMultAgency(){
	}
}
