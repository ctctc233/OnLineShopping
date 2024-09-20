import com.mapper.UserMapper;
import com.pojo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("logout".equals(action)) {
			resp.sendRedirect("login.html");
		} else {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			System.out.println("username: " + username + " password: " + password);
			// 读取mybatis-config.xml配置文件
			String resource = "mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			// 创建SqlSessionFactory工厂
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			User user = userMapper.selectUser(username, password);
			System.out.println("user: " + user);
			if (user != null) {
				req.getSession().setAttribute("user", user);
				HttpSession session = req.getSession();
				session.setAttribute("name", username);
				session.setAttribute("role", user.getRole());
				req.getRequestDispatcher("home_page.jsp").forward(req, resp);
			} else {
				resp.sendRedirect("login.html");
			}
		}
	}
}
