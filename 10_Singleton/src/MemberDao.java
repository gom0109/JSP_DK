
public class MemberDao {
	private static MemberDao instance;/* static 메소드안에서는 static변수만 사용가능하다 */

	private MemberDao() {
		System.out.println("MemberDao 생성자");
	}

	public static MemberDao getInstance() {// MemberDao리턴하는 메소드, 생성자의 접근제한자가 private이므로 다른클래스에서 객체를만들수없어 static으로만든다.
		System.out.println("instance" + instance);
		if (instance == null) {
			instance = new MemberDao();// 객체 생성 MemberDao instance = new MemberDao();
		}
		return instance;
	}

	public void orange() {
		System.out.println("orange");
	}

	public void banana() {
		System.out.println("banana");
	}

}
