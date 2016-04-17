package sstation

class CommOrgController {

    /*
	 * Methods about community agencies
	 */
	/**
	 * Community Agency Main Page
	 * @return
	 */
	def agMain(){
		def list=CommAg.list()
		render view:"agMain",model:[list:list]
	}

	def _agTable(){
		def list=CommAg.list()
		render view:"_agTable",model:[list:list]
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

	def _saveAgencyToAgMain(CommAg agency){
		agency.properties=params
		agency.save(flush:true,failOnError:true)
		def list=CommAg.list()
		render view:"agMain",model:[list:list]
	}
	
	def _saveAgencyToOA(CommAg agency){
		agency.properties=params
		agency.save(flush:true,failOnError:true)
		def list=CommAg.list()
		render view:"agMain",model:[list:list]
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
		agMain()
	}

	def _deleteMultAgency(){

	}
}
