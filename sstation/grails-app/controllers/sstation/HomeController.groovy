package sstation

class HomeController {
	def hourService

	/**
	 * Render the main home page for either a student or an admin member
	 * @return
	 */
	def index(){//dashboard Home page

		def map=hourService.hourCall()//prepare data for the statistic diagrams on the home page

		def shList=ServiceHour.findAllByStatus(Status.PENDING)
		def list=[]
		
		if(shList!=null&&shList.size()>5){
			list=shList[0..4]
		}
		
		if(map!=null){
			map<<[list:list]
		}
		
		render view:"index", model:map
	}
}
