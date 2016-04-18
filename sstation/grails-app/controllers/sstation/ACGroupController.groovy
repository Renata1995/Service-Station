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
	
	def _saveOnCard(CampusOrg org){
		org.properties=params		
		
		try{
			org.save(flush:true,failOnError:true)
			def orgList=CampusOrg.list()
			render view:"index", model:[list:orgList]
		}
		catch(error){
			print("error")
			render view:"_orgForm",model:[org:org,heading:org.name]
		}
		
	}
	
	def _saveOnTable(CampusOrg org){
		org.properties=params
		org.save(flush:true,failOnError:true)
		
		def list=CampusOrg.list()
		render view:"index",model:[list:list,table:1]
	}
	
	def _deleteOnCard(CampusOrg org){
		ServiceHour.findAllByCampusOrg(org).each{
			it.delete(flush:true,failOnError:true)
		}
		org.delete(flush:true,failOnError:true)
		def list=CampusOrg.list()
		render view:"_orgCardMain",model:[list:list]
	}
	
	def _deleteOnTable(CampusOrg org){
		ServiceHour.findAllByCampusOrg(org).each{
			it.delete(flush:true,failOnError:true)
		}
		org.delete(flush:true,failOnError:true)
		
		def list=CampusOrg.list()
		render view:"_orgTable",model:[list:list]
	}
}
