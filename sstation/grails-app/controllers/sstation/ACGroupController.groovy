package sstation

class ACGroupController {

    /*
	 * Methods about Campus Organizations
	 */
	
	/**
	 * The main page for organization and agencies. Display 10 of each
	 * @return
	 */
	
	def index(){
		def list=CampusOrg.list()
		[list:list]
	}
	def _orgCardMain(){
		def orgList=CampusOrg.list()
		render view:"_orgCardMain",model:[list:orgList]
	}
	
	def _orgTableMain(){
		def list=CampusOrg.list()
		render view:"_orgTable",model:[list:list]
	}
	
	def _createOrg(){
		CampusOrg org=new CampusOrg();
		def heading="New Campus Organization"
		render view:"_orgForm",model:[org:org,heading:heading]
	}	
	def _editOrg(CampusOrg org){
		render view:"_orgForm",model:[org:org,heading:org.name]
	}
	/**
	 * Save or update a org and direct to the card view
	 * @param org
	 * @return
	 */
	def _saveOnCard(CampusOrg org){
		org.properties=params
		if (!org.save(flush:true)) {
			render view:'index', model:[org:org,form:1,card:1] 
			return
		}
		
		agency.save(flush:true,failOnError:true)
		def list=CommAg.list()
		render view:"index",model:[list:list]
		
	}
	/**
	 * Save or update an org and direct to the table view
	 * @param org
	 * @return
	 */
	def _saveOnTable(CampusOrg org){
		org.properties=params
		if(!org.save(flush:true)){
			render view:'index', model:[org:org,form:1]
			return
		}
		def list=CampusOrg.list()
		render view:"index",model:[list:list,table:1]
	}

	/**
	 * Delete an org and direct to the card view
	 * @param org
	 * @return
	 */
	def _deleteOnCard(CampusOrg org){
		ServiceHour.findAllByCampusOrg(org).each{
			it.delete(flush:true,failOnError:true)
		}
		org.delete(flush:true,failOnError:true)
		def list=CampusOrg.list()
		render view:"_orgCardMain",model:[list:list]
	}
	/**
	 * Delete an org and direct to the table view
	 * @param org
	 * @return
	 */
	def _deleteOnTable(CampusOrg org){
		ServiceHour.findAllByCampusOrg(org).each{
			it.delete(flush:true,failOnError:true)
		}
		org.delete(flush:true,failOnError:true)
		
		def list=CampusOrg.list()
		render view:"_orgTable",model:[list:list]
	}
}
