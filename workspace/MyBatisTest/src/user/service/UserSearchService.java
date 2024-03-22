package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

    @Override
    public void execute() {
        Scanner scan = new Scanner(System.in);
        UserDAO userDAO = UserDAO.getInstance();
        int num;
        
        while (true) {
            System.out.println();
            System.out.println("  1. 이름 검색");
            System.out.println("  2. 아이디 검색");
            System.out.print("번호 입력 : ");
            num = scan.nextInt();
            
            if (num == 0) break;

            Map<String, String> searchMap = new HashMap<>();

            if (num == 1) {
                System.out.println("검색할 이름 입력 : ");
                String search_name = scan.next();
                searchMap.put("name", "%" + search_name + "%");
            } else if (num == 2) {
                System.out.println("검색할 아이디 입력 : ");
                String search_id = scan.next();
                searchMap.put("id", "%" + search_id + "%");
            }

            // DB
            List<UserDTO> list = userDAO.search(searchMap);

            // 응답
            for (UserDTO userDTO : list) {
                System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
            }
        }//while
    }
}
