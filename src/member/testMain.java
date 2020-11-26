package member;

import jsp.userInfo.*;

public class testMain {

	public static void main(String[] args) {
		/*
		 * String path = System.getProperty("user.dir"); System.out.println(path);
		 */
		UserInfoBean user = new UserInfoBean();
		
		user.setName("금요일");
		user.setPh("01044223497");
		user.setArea("경기");
		
		
		UserInfoDAO dao = UserInfoDAO.getInstance();
		dao.insertUser(user);
		
		int serial = 4;
		String number = String.format("%04d", serial);
		System.out.println(number);
	
	}

}
