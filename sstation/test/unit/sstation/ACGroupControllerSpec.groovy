package sstation

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ACGroupController)
class ACGroupControllerSpec extends Specification {

     void "test when successful save and save view shown"() {
		
		when:
		def co=Mock(CampusOrg)
		controller._saveOnCard(co)
		
		then:
		view=="/ACGroup/formSaved"
    }
	
	void "test when not saved successfully and form view will be shown"(){
		when:
		def co=Mock(CampusOrg)
		co.contactPhone="aaaa"
		controller._saveOnCard(co)
		
		then:
		view=="/ACGroup/orgForm"
		model.form==1
		model.card==1
	}
	
	void "test that if an agency is not saved(_saveOnTable) successfully the form view will be rendered"(){
		when:
		def co=Mock(CampusOrg)
		co.contactPhone="aaaa"
		controller._saveOnCard(co)
		
		then:
		view=="/ACGroup/orgForm"
		model.form==1
	}
	
	void "test when not saved successfully and save view will be shown" (){
		when:
		def co=Mock(CampusOrg)
		co.contactEmail="aaaa"
		controller._saveOnCard(co)
		
		then:
		view=="/ACGroup/formSaved"
		model.form==1
	}
}
