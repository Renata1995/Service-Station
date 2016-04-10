package sstation
import sstation.AcStudent;
import sstation.AcStudentController;
import sstation.CampusOrg;
import sstation.Classification;
import sstation.ServiceHour;
import sstation.Status;
import grails.test.runtime.FreshRuntime;
import grails.test.mixin.*
import spock.lang.*

@TestFor(AcStudentController)
@Mock([AcStudent,ServiceHour,CampusOrg])
@FreshRuntime
class AcStudentControllerSpec extends Specification {
	def rand
	
	def setup(){
		rand=new Random()
	}
	/**
	 * Testing methods about student management
	 */
	void "test _studentList which renders the student management main page"(){
		when:"execute _studentList with no students"
		controller._studentList()
		then:"No students will be in the list"
		view=="/acStudent/student/_studentList"
		model.list.size()==0

		when: "There are 10 students"
		10.times{
			new AcStudent(firstname:"Renata",lastname:"Chai",acid:"AC3483"+it,acEmail:"rchai13@austincollege.edu",acBox:"11111",acYear:2013,classification:Classification.JU,phone:"1111111111").save(flush:true,failOnError:true)
		}
		controller._studentList()
		then:"10 students will be shown in the list"
		view=="/acStudent/student/_studentList"
		model.list.size()==10
		model.list[0].firstname=="Renata"
	}

	void "test sTable which leads to the student list"(){
		when:"execute _studentList with no students"
		controller._sTable()
		then:"No students will be in the list"
		view=="/acStudent/student/_sTable"
		model.list.size()==0

		when: "There are 10 students"
		10.times{
			new AcStudent(firstname:"Renata",lastname:"Chai",acid:"AC3483"+it,acEmail:"rchai13@austincollege.edu",acBox:"11111",acYear:2013,classification:Classification.JU,phone:"1111111111").save(flush:true,failOnError:true)
		}
		controller._sTable()
		then:"10 students will be shown in the list"
		view=="/acStudent/student/_sTable"
		model.list.size()==10
		model.list[0].firstname=="Renata"
	}

	void "test _student which leads the student main page"(){
		when:
		AcStudent ac=new AcStudent(firstname:"Renata",lastname:"Chai",acid:"AC3483",acEmail:"rchai13@austincollege.edu",acBox:"11111",acYear:2013,classification:Classification.JU,phone:"1111111111").save(flush:true,failOnError:true)
		controller._student(ac)
		then:
		view=="/acStudent/student/_student"
		model.acStudentInstance==ac

	}

	void "test _showStudent which leads to the information page about the current student"(){
		when:
		AcStudent ac=new AcStudent(firstname:"Renata",lastname:"Chai",acid:"AC3483",acEmail:"rchai13@austincollege.edu",acBox:"11111",acYear:2013,classification:Classification.JU,phone:"1111111111").save(flush:true,failOnError:true)
		controller._showStudent(ac)
		then:
		view=="/acStudent/student/_showStudent"
		model.acStudentInstance==ac
	}
	void "test _createStudent which leads to the student creation form "(){
		when:
		controller._createStudent()
		then:
		view=="/acStudent/student/_createStudent"
	}
	void "test _saveStudent which saves the newly created student and leads to the student infor. page"(){
		when:
		int count=AcStudent.count()
		AcStudent ac=new AcStudent(firstname:"Renata",lastname:"Chai",acid:"AC3483",acEmail:"rchai13@austincollege.edu",acBox:"11111",acYear:2013,classification:Classification.JU,phone:"1111111111").save(flush:true,failOnError:true)
		controller.save(ac)
		then:
		view=="/acStudent/student/_student"
		model.acStudentInstance==ac
		AcStudent.count()==count+1

	}
	void "test _editStudent which leads to the student edition form"(){
		when:
		AcStudent ac=new AcStudent(firstname:"Renata",lastname:"Chai",acid:"AC3483",acEmail:"rchai13@austincollege.edu",acBox:"11111",acYear:2013,classification:Classification.JU,phone:"1111111111").save(flush:true,failOnError:true)
		controller._editStudent(ac)
		then:
		view=="/acStudent/student/_editStudent"
	}
	void "test updateStudent which update the edited student and leads to the student infor page"(){
		when:
		AcStudent ac=new AcStudent(firstname:"Renata",lastname:"Chai",acid:"AC3483",acEmail:"rchai13@austincollege.edu",acBox:"11111",acYear:2013,classification:Classification.JU,phone:"1111111111").save(flush:true,failOnError:true)
		controller.update(ac)
		then:
		view=="/acStudent/student/_showStudent"
		model.acStudentInstance==ac
	}
	
	void "test delete Student"(){
		when:
		AcStudent ac=new AcStudent(firstname:"Renata",lastname:"Chai",acid:"AC3483",acEmail:"rchai13@austincollege.edu",acBox:"11111",acYear:2013,classification:Classification.JU,phone:"1111111111").save(flush:true,failOnError:true)
		int count=AcStudent.count()
		controller.delete(ac)
		then:
		view=="/acStudent/student/_sTable"
		model.list.size()==count-1
	}
	
	void "test deleting multiple student"(){
		when:"There are 10 students and students 1,3,5 are deleted"
		10.times{
			new AcStudent(firstname:"Renata",lastname:"Chai",acid:"AC3483"+it,acEmail:"rchai13@austincollege.edu",acBox:"11111",acYear:2013,classification:Classification.JU,phone:"1111111111").save(flush:true,failOnError:true)
		}
		params.checkstudent=["1","3","5"]
		controller.deletemult()
		then:"7 students left"
		view=="/acStudent/student/_studentList"
		model.list.size()==7
		AcStudent.get(1)==null
		AcStudent.get(3)==null
		AcStudent.get(5)==null
	}
	
	
	
	
	/**
	 * Service Hour Management 
	 */

	void "test _shour which leads to the basic infor of the current service hour"(){
		10.times{
			Mock(ServiceHour).save(flush:true,failOnError:true)
		}
		when:
		controller._shour(ServiceHour.get(1))
		then:
		view=="/acStudent/shour/_shour"
		model.shour==ServiceHour.get(1)
	}
	
	void "test creating a service hour"(){
		def s=Mock(AcStudent)
		when:
		controller._createShour(s)
		then:
		view=="/acStudent/shour/_createShour"
	}
	
	void "test editing a service hour"(){
		when:
		def sh=Mock(ServiceHour)
		controller._editShour(sh)
		then:
		view=="/acStudent/shour/_editShour"
	}
	
	void "test _totalHList"(){
		when:
		10.times{
			def sh=Mock(ServiceHour).save(flush:true)
		}
		controller._totalHList()
		then:
		view=="/acStudent/hour/_totalHList"
	}
	
	
	
	/**
	 * Report Method
	 */
	void "test _report"(){
		when:
		def s=Mock(AcStudent)
		controller._report(s)
		then:
		view=="/acStudent/report/_report"
	}
	
	void "test _reportAdmin"(){
		def s=Mock(AcStudent)
		when:
		controller._reportAdmin(s)
		then:
		view=="/acStudent/report/_reportAdmin"
	}	

	/**
	 * Organization Management
	 */
	void "test _orgList"(){
		when:
		10.times{
			Mock(CampusOrg).save(flush:true,failOnError:true)
		}
		controller._orgList()
		then:
		view=="/acStudent/org/_orgList"
		model.list==CampusOrg.list()
	}
	void "test _org"(){
		when:
		def s=Mock(CampusOrg)
		controller._org(s)
		then:
		view=="/acStudent/org/_org"
	}
	void "test _createOrg"(){
		when:
		controller._createOrg()
		then:
		view=="/acStudent/org/_createOrg"
		
	}
	void "test _editOrg"(){
		when:
		def s=Mock(CampusOrg)
		controller._editOrg(s)
		then:
		view=="/acStudent/org/_editOrg"
	}
}
