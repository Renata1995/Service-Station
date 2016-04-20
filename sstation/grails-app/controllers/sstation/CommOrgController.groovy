package sstation

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

	def _agOverallKPI(){

	}

	def _agKPI(){

	}

	def _createAgency(){
		CommAg ag=new CommAg()
		def heading="New Community Agency"
		render view:"_agForm",model:[agency:ag,heading:heading]
	}

	def _editAgency(CommAg ag){
		def heading=ag.name
		render view:"_agForm",model:[agency:ag,heading:heading]
	}

	def _saveOnCard(CommAg agency){
		agency.properties=params
		if (!agency.save(flush:true)) {
			render view:'index', model:[agency:agency,form:1,card:1] 
			return
		}
		
		//agency.save(flush:true,failOnError:true)
		def list=CommAg.list()
		render view:"index",model:[list:list]
	}
	
	def _saveOnTable(CommAg agency){

		agency.properties=params
		if (!agency.save(flush:true)) {
			render view:'index', model:[agency:agency,form:1]
			return
		}
		def list=CommAg.list()
		render view:"index",model:[list:list,table:1]
	}

	def _deleteOnTable(CommAg ag){
		ServiceHour.findAllByCommAg(ag).each{
			it.delete(flush:true,failOnError:true)
		}
		ag.delete(flush:true,failOnError:true)
		_agTable()
	}

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
