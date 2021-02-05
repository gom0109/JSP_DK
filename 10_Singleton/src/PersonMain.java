
public class PersonMain {

	public static void main(String[] args) {
		PersonDao dao1 = new PersonDao();
		dao1.orange();
		dao1.banana();
		
		
		PersonDao dao2 = new PersonDao();
		dao2.orange();
		dao2.banana();
		
		
		System.out.println("dao1林家" +dao1);
		System.out.println("dao2林家" +dao2);
		if(dao1==dao2) {
			System.out.println("林家鞍澜");
		}else {
			System.out.println("林家促抚");
		}
		System.out.println("==========================");
		
		
		
		
	}

}
