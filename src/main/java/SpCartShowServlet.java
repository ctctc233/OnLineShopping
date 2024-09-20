import com.mapper.SpCartMapper;
import com.pojo.ShoppingCart;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/SpCartShowServlet")
public class SpCartShowServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		int offset = 1;
		int limit = 10;
		int total;
		if (req.getParameter("offset")!= null) {
			offset = Integer.parseInt(req.getParameter("offset"));
		}

		// 读取mybatis-config.xml配置文件
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建SqlSessionFactory工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		SpCartMapper spCartMapper = sqlSession.getMapper(SpCartMapper.class);

		// 从session中获取用户id
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("name");
		//List<ShoppingCart> cartList = spCartMapper.selectCartByUserId(userId);
		Map<String, Object> params = new HashMap<>();
		params.put("userId", userId);
		params.put("offset", (offset - 1) * limit);
		params.put("limit", limit);

		List<ShoppingCart> cartList = spCartMapper.selectCartByUserId(params);

		System.out.println(cartList);

		// 设置总记录数
		total = spCartMapper.selectCountShoppingCart();
		int pageCount = total / limit;
		if (total % limit > 0) {
			pageCount++;
		}
		// 传参
		session.setAttribute("cartList", cartList);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("offset", offset);
		req.setAttribute("limit", limit);
		req.getRequestDispatcher("sp_card_page.jsp").forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
