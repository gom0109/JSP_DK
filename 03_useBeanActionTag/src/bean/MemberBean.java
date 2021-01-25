package bean;

public class MemberBean {
	
	private String name;
	private String hobby;
	

	
	public void setName(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
		System.out.println(hobby);
	}
	
}
