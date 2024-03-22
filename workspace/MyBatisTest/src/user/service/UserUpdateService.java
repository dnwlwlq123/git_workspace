package user.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService{

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		UserDTO userDTO = new UserDTO();
		String id;
		
		
		
		while(true) {
		System.out.print("수정할 아이디 입력 : ");
		id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		userDTO = userDAO.updateCheckId(id);

			if(userDTO != null) {
			System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
			
			System.out.print("수정할 이름 입력");
			String name = scan.next();
			System.out.print("수정할 비밀번호 입력");
			String pwd = scan.next();
			
			userDTO.setName(name);
			userDTO.setPwd(pwd);
			
			userDAO.update(userDTO);
			
			System.out.println("수정 완료");
			break; 
		} 
			
			else {
				System.out.println("찾고자 하는 아이디가 없습니다.");
			}
		}
	}
		
}


