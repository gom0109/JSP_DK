
public class MemberMain {

	public static void main(String[] args) {
		System.out.println("��ü�� �ϳ���������ֵ��� �������Ǵ� �̱���");
		// MemberDao dao = new MemberDao();//private���� �����ڸ� ����� ��ü�� ���������.
		MemberDao dao = MemberDao.getInstance();// static�޼ҵ� ȣ��
		System.out.println("dao : " + dao);
		dao.banana();
		dao.orange();
		MemberDao dao2 = MemberDao.getInstance();
		System.out.println("dao2 : " + dao2);/* dao1�� dao2�� �ּҰ����� */
		dao2.banana();
		dao2.orange();
		if (dao == dao2) {
			System.out.println("�ּҰ���");
		} else {
			System.out.println("�ּҴٸ�");
		}
	}

}
/*
 * �̱��� ����: 1.�����ڴ� private 2.private static���� ���� (�ڽ�)Ŭ������ ��ü�� �������ִ� �������� 3. ������
 * ��ü (�ν��Ͻ�)�� �����ϴ� static�޼ҵ带 �����Ѵ�.(���� getInstance�� ����Ѵ�.) 4.
 */
