import com.mapper.OrderMapper;
import com.pojo.OrderDetail;
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

@WebServlet("/OrderMangeServlet")
public class OrderMangeServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String action = req.getParameter("btn");
		String orderCode = req.getParameter("orderCode");
		String orderPayment = req.getParameter("orderPayment");
		String orderTotalPrice = req.getParameter("orderTotalPrice");

		int offset = 1;
		int limit = 10;
		int total;
		if (req.getParameter("offset") != null) {
			offset = Integer.parseInt(req.getParameter("offset"));
		}

		// 读取mybatis-config.xml配置文件
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建SqlSessionFactory工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);

		if (action.equals("详情")) {
			Map<String, Object> params = new HashMap<>();
			params.put("orderCode", orderCode);
			params.put("offset", (offset - 1) * limit);
			params.put("limit", limit);

			List<OrderDetail> orderDetail = orderMapper.selectOrderIdDetail(params);
			for (OrderDetail orderDetail1 : orderDetail) {
				System.out.println(orderDetail1);
			}
			// 设置总记录数
			total = orderMapper.selectOrderIdDetailCount(orderCode);
			int pageCount = total / limit;
			if (total % limit > 0) {
				pageCount++;
			}

			HttpSession session = req.getSession();
			session.setAttribute("orderTotalPrice", orderTotalPrice);
			req.setAttribute("orderPayment", orderPayment);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("offset", offset);
			req.setAttribute("limit", limit);
			req.setAttribute("orderDetail", orderDetail);
			req.setAttribute("orderCode", orderCode);
			req.getRequestDispatcher("order_detail.jsp").forward(req, resp);
		} else if (action.equals("删除")) {
			orderMapper.deleteOrder(req.getParameter("orderCode"));
			resp.sendRedirect("order_page.jsp");
		} else if (action.equals("发货")) {
			orderMapper.updateOrderSendStatus(orderCode);
			resp.sendRedirect("order_page.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
