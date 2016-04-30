package sstation

import grails.transaction.Transactional
import java.security.MessageDigest
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils


@Secured(['ROLE_ADMIN','ROLE_STUDENT','ROLE_MODERATOR'])

@Transactional(readOnly = false)
class HomeController {
	
	def hourService
	def springSecurityService
	
	/**
	 * Redirect the main home page for either a student or an admin member
	 * @return
	 */
	def index(){//dashboard Home page

		def principal = springSecurityService.principal
		
		String username = principal.username
		// a Collection of GrantedAuthority
		def authorities = principal.authorities
		boolean enabled = principal.enabled
		
		
		if (SpringSecurityUtils.ifAllGranted('ROLE_MODERATOR') || SpringSecurityUtils.ifAllGranted('ROLE_STUDENT')) {
			
			// find the current student id by using the user login (email?) 
			def sid = 1  
			
			// smelly code here.   we need a dedicated field to hold just the username 
			// part by itself
			def stud = AcStudent.findByAcEmail(username+"@austincollege.edu")
			if (stud) {
				// if we found a match
			} else {
				// redirect to error page... no matching student id.
			}
			
			return redirect (controller:'acStudent',action:'home', id:sid)
		}
		else {
		
			return redirect (action:'home')
		}
		
	}
	
	
	/**
	 * After authentication, we land here if the user is admin.
	 * 
	 * @return
	 */
	def adminHome() {
		
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
