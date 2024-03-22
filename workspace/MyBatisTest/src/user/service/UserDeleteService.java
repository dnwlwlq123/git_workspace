package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService{

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		UserDTO userDTO = new UserDTO();
		String id;
	
		while(true) {
			System.out.print("삭제할 아이디 입력 : ");
			id = scan.next();
			
			UserDAO userDAO = UserDAO.getInstance();
			userDTO = userDAO.updateCheckId(id);

				if(userDTO != null) {
					userDAO.delete(id);
					System.out.println("삭제 완료");
					break;
				}else {
					System.out.println("찾는 아이디가 없습니다.");
			}
		}
		
	}

}
