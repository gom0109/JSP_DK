
public class MemberMain {

	public static void main(String[] args) {
		System.out.println("객체를 하나만만들수있도록 제한을건다 싱글톤");
		// MemberDao dao = new MemberDao();//private으로 생성자를 만들면 객체를 만들수없다.
		MemberDao dao = MemberDao.getInstance();// static메소드 호출
		System.out.println("dao : " + dao);
		dao.banana();
		dao.orange();
		MemberDao dao2 = MemberDao.getInstance();
		System.out.println("dao2 : " + dao2);/* dao1과 dao2의 주소가같음 */
		dao2.banana();
		dao2.orange();
		if (dao == dao2) {
			System.out.println("주소같음");
		} else {
			System.out.println("주소다름");
		}
	}

}
/*
 * 싱글톤 패턴: 1.생성자는 private 2.private static으로 현재 (자신)클래스의 객체를 담을수있는 변수설정 3. 생성된
 * 객체 (인스턴스)를 리턴하는 static메소드를 정의한다.(보통 getInstance라 명명한다.) 4.
 */
