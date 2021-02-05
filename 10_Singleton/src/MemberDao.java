
public class MemberDao {
	private static MemberDao instance;/* static �޼ҵ�ȿ����� static������ ��밡���ϴ� */

	private MemberDao() {
		System.out.println("MemberDao ������");
	}

	public static MemberDao getInstance() {// MemberDao�����ϴ� �޼ҵ�, �������� ���������ڰ� private�̹Ƿ� �ٸ�Ŭ�������� ��ü����������� static���θ����.
		System.out.println("instance" + instance);
		if (instance == null) {
			instance = new MemberDao();// ��ü ���� MemberDao instance = new MemberDao();
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
