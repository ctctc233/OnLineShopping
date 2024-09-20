import com.mapper.OrderMapper;
import com.pojo.PlaceOrder;
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
import java.util.List;

@WebServlet("/OrderShowServlet")
public class OrderShowServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		// 分页数据
		int offset = 1;
		int limit = 10;
		int total = 0;
		if (req.getParameter("currentPage")!= null) {
			offset = Integer.parseInt(req.getParameter("currentPage"));
		}
		//获取用户名
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("name");
		int role = (int) session.getAttribute("role");


		// 读取mybatis-config.xml配置文件
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建SqlSessionFactory工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);

		List<PlaceOrder> placeOrder = null;

		//判断角色
		if (role == 1) {
			// 顾客
			placeOrder = orderMapper.selectPlaceOrder(username, (offset - 1) * limit, limit);
			for (PlaceOrder placeOrder1 : placeOrder) {
				System.out.println(placeOrder1);
			}

			// 设置总记录数
			total = orderMapper.selectPlaceOrderCount(username);
		} else if (role == 0) {
			// 管理员
			placeOrder = orderMapper.selectAllPlaceOrder((offset - 1) * limit, limit);
			for (PlaceOrder placeOrder1 : placeOrder) {
				System.out.println(placeOrder1);
			}

			// 设置总记录数
			total = orderMapper.selectAllPlaceOrderCount();
		}

		int pageCount = total / limit;
		if (total % limit > 0) {
			pageCount++;
		}
		sqlSession.commit();

		// 设置分页信息
		req.setAttribute("currentPage", offset);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("placeOrder", placeOrder);
		req.getRequestDispatcher("order_page.jsp").forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
