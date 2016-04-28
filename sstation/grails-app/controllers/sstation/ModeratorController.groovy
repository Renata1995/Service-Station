package sstation

class ModeratorController {

    def index() { 
		def list=AcStudent.list()   //Prepare the student list
		def rs = []
		for (int i = 0; i < list.size(); i++){
			if (list.get(i).isModerator){
				rs.add(list.get(i))
			}
		}
		render view:"index",model:[list:rs]//Map and return the student list
	}
	
	def _presentStudentTable(){
		def li=AcStudent.list()
		render view:'_tableStudent', model:[list: li]
	}
	
	def _addModerator(AcStudent acStudent){
		acStudent.isModerator = true
		acStudent.save(flush:true)
		def list=AcStudent.list()   //Prepare the student list
		def rs = []
		for (int i = 0; i < list.size(); i++){
			if (list.get(i).isModerator){
				rs.add(list.get(i))
			}
		}
		println rs.size();
		render view:"_sTable",model:[list:rs]//Map and return the student list
	}
	
}
