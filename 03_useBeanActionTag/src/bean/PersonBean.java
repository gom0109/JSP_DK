package bean;

public class PersonBean {
	
	private String name;
	private int age;
	private String address;
	private String tel;
	
	public PersonBean() {
		
	}
	public void setName(String name) {
		this.name=name;
	}
	
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	

}
