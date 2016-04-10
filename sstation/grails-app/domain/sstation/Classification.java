package sstation;

public enum Classification {
	FR("Freshman"),
	SO("Sophomore"),
	JU("Junior"),
	SE("Senior"),
	GRAD("Graduate Student"),
	OTHER("Other");
	
	final String name;
	
	private Classification(String name){
		this.name=name;
	}
}
