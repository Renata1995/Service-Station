package sstation

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ReportsController)
@Mock([ServiceHour,StationReportService])
class ReportsControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test yearReport"() {
		when:
			controller.stationReportService=Mock(StationReportService)
			controller.yearReport()
		then:
			view=="/reports/yearReport"
			
    }
	
	void "test _hoursByYear"() {
		when:
			params.year="2016"
			controller._hoursByYear()
		then:
			view=="/reports/_hoursByYear"
		
	}
}
