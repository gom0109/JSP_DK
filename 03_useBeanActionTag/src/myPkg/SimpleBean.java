package myPkg;

public class SimpleBean {
	private String msg;
	
	public SimpleBean() {
		System.out.println("SimpleBean");
	}
	
	public void setMsg(String msg) {
		/*
		 * if(msg.length()>3) {
		 * 
		 * }
		 */
		this.msg=msg;
	}
	
	public String getMsg() {
		return msg;
	}
}
