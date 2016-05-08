import java.text.SimpleDateFormat

import sstation.*

/**
 * Store Date 
 * @author lenovo
 *
 */

class BootStrap {
	
	
	def random=new Random()
	//lists used to generate random names
	def fn=['John','Mary','Mike','Jenny','Aaron','Priya','Marrisa','Brittany']
	def ln=("Higgs,Block,Gorman,Countryman,Bortan,Mattew,Frindly").split(",")

	//community agency names list
	def agNameList=['N/A','Texas Community Center','Crisis Center','Big Brothers and Sisters','Sherman Elementary School','Charity Group',"Sherman Church"]


	def init = { servletContext ->

		log.debug("creating roles and users")
		
		def adminRole = new AcRole(authority: "ROLE_ADMIN").save(flush:true)
		def studentRole = new AcRole(authority: "ROLE_STUDENT").save(flush:true)
		def moderatorRole = new AcRole(authority: "ROLE_MODERATOR").save(flush:true)
	
		def testAdminUser = new AcUser(username:'admin', password: 'admin_secret').save(flush:true)
		def testStudentUser = new AcUser(username:'student', password: 'student_secret').save(flush:true)
		def testModeratorUser = new AcUser(username:'moderator', password: 'moderator_secret').save(flush:true)
		
		AcUserAcRole.create(testAdminUser, adminRole, true)
		AcUserAcRole.create(testStudentUser, studentRole, true)
		AcUserAcRole.create(testModeratorUser, moderatorRole, true)
		
		assert AcUser.count() == 3
		assert AcRole.count() == 3
		assert AcUserAcRole.count() == 3

		
		/*
		 * Create testing organizations
		 */
		def orgList=[]
		orgList.add(randomOrg("Service Station"))
		orgList.add(randomOrg("Habitat of Humanity"))
		orgList.add(randomOrg("AC Church"))
		orgList.add(randomOrg("THINK"))
		orgList.add(randomOrg("BIG"))
		orgList.add(randomOrg("APO"))
		orgList.add(randomOrg("N/A"))

		def eventList=[]
		eventList.add(randomEvent("N/A"))
		eventList.add(randomEvent("Great Day of Service"))
		eventList.add(randomEvent("First We Serve"))
		eventList.add(randomEvent("GreenServe"))
		eventList.add(randomEvent("RooBound"))
		eventList.add(randomEvent("JanServe"))
		eventList.add(randomEvent("Austin College Tutoring(ACT"))
		eventList.add(randomEvent("Alternative Spring Break"))
		eventList.add(randomEvent("Other"))

		def agList=[]
		agNameList.each{
			agList.add(randomAg(it))
		}
		//if needed
		//here i created a new CommAg called other as just a spacer and nothing more
		CommAg other=new CommAg(address:"In America",name:"Other",description:"placeholder for more organizations",contact:"Austin College",contactPhone:"9038132000",contactEmail:"nmorgan@austincollege.edu")
		other.save(failOnError:true,flush:true)
		agList.add(other)

		10.times{
			//Generate random students
			AcStudent s=randomStudent()

			10.times{
				//Generate random service hours for the current student
				int r=random.nextInt(orgList.size())
				int r2=random.nextInt(eventList.size())
				int r3=random.nextInt(agList.size())
				ServiceHour sh=randomSH(orgList[r],eventList[r2],agList[r3])

				s.addToServiceHours(sh).save(failOnError:true,flush:true)

			}
		}
	}


	/**
	 * Generate a random AcStudent 
	 * @return
	 */
	private AcStudent randomStudent(){
		String fname=fn[random.nextInt(fn.size())]
		String lname=ln[random.nextInt(ln.size())]

		String id="AC${random.nextInt(10000)+50000}";
		int year=random.nextInt(4)+2012
		Classification clas;
		switch(year-2011){
			case 1:
				clas=Classification.FR
				break
			case 2:
				clas=Classification.SO
				break
			case 3:
				clas=Classification.JR
				break
			case 4:
				clas=Classification.SR
				break
			default:
				clas=Classification.OTHER
		}
		char stat = 'A'

		String box="${random.nextInt(30000)+30000}"
		String email=fname.substring(0,1)+lname+(year-2000)+"@austincollege.edu"

		return new AcStudent(isModerator:false,firstname:fname,lastname:lname,status:stat,acid:id,acEmail:email,acBox:box,acYear:year,classification:clas,phone:"903820784")
	}

	/**
	 * Generate a random service hour
	 * @return
	 */
	private ServiceHour randomSH(CampusOrg org,Event event,CommAg ag){

		String status
		switch(random.nextInt(3)){
			case 0:
				status=Status.PENDING
				break
			case 1:
				status=Status.APPROVED
				break
			case 2:
				status=Status.REJECTED
				break
			default:
				status=Status.PENDING
		}

		double duration=(double)random.nextInt(4)+(double)(1+random.nextInt(4))/4.0
		def first=fn[random.nextInt(fn.size())]
		def last=ln[random.nextInt(ln.size())]
		def name=first+" "+last
		def email=first.substring(0,1)+last+"@austincollege.edu"


		def year=111+random.nextInt(5)
		def month=1+random.nextInt(12)
		def date=1+random.nextInt(28)
		def hour=8+random.nextInt(10)
		def min=random.nextInt(60)
		def starttime=new Date(year,month,date,hour,min,0)
		def mod=new Date()


		ServiceHour sh=new ServiceHour(event:event,campusOrg:org,description:"service",status:status,commAg:ag,eventContactName:name,eventContactPhone:"9048937894",eventContactEmail:email,duration:duration,starttime:starttime,lastmodified:mod)
		return sh
	}


	/**
	 * Generate a random organization
	 * @param orgName  the name of the organization
	 * @return
	 */
	private CampusOrg randomOrg(String orgName){
		def first=fn[random.nextInt(fn.size())]
		def last=ln[random.nextInt(ln.size())]
		def name=first+" "+last
		def email=first.substring(0,1)+last+"@austincollege.edu"
		String contactPhone="9089038898"
		CampusOrg org=new CampusOrg(name:orgName,description:orgName,contact:name,contactPhone:contactPhone,contactEmail:email)
		org.save(failOnError:true,flush:true)
		return org
	}

	/**
	 * Generate a random event
	 * @param eventName the name of the event
	 * @return
	 */
	private Event randomEvent(String eventName){
		Event e=new Event(name:eventName)
		e.description="Contact the Service Station office to sign up! "

		int count=3

		def first=fn[random.nextInt(fn.size())]
		def last=ln[random.nextInt(ln.size())]
		def name=first+" "+last

		e.contact=name
		e.contactPhone="9089038898"
		e.contactEmail=first.substring(0,1)+last+"@austincollege.edu"

		e.save(flush:true,failOnError:true)
		return e;
	}

	/**
	 * Generate a random community agency
	 * @param agName  the name of the agency
	 * @return
	 */
	private CommAg randomAg(String agName){
		def first=fn[random.nextInt(fn.size())]
		def last=ln[random.nextInt(ln.size())]
		def name=first+" "+last
		def email=first.substring(0,1)+last+"@austincollege.edu"
		String contactPhone="9089038898"
		String address="900N. Grand Ave., Sherman, TX"
		CommAg ag=new CommAg(address:address,name:agName,description:agName,contact:name,contactPhone:contactPhone,contactEmail:email)
		ag.save(failOnError:true,flush:true)
		return ag
	}

	def destroy = {
	}
}
