
public class BookDao {
	private static BookDao instance;

	private BookDao() {
		System.out.println("BookDao ������");
	}

	public static BookDao getInstance() {
		if (instance == null) {
			instance = new BookDao();
		}
		return instance;
	}

}
