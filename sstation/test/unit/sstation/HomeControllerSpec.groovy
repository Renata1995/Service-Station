package sstation

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(HomeController)
@Mock([ServiceHour,HourService])
class HomeControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test that view is index"() {
		when:"index method is called"
		controller.hourService=Mock(HourService)
		controller.index()
		then:"view should be index"
		view=="/home/index"
    }
}
