import com.mapper.GoodsMapper;
import com.mapper.OrderMapper;
import com.pojo.OrderItem;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取用户名
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("name");

		// 读取mybatis-config.xml配置文件
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建SqlSessionFactory工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		// 获取选中的商品ID
		String[] selectedGoods = req.getParameterValues("selectedGoods");
		String[] quantity = req.getParameterValues("quantity");
		System.out.println("Selected goods: " + Arrays.toString(selectedGoods));
		System.out.println("Quantity: " + Arrays.toString(quantity));
		// 生成订单号
		String orderCodeStr = OrderCode.createOrderNo();

		// 查询商品对应价格
		List<String> orderItemsIds = new ArrayList<>(Arrays.asList(selectedGoods));
		GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
		List<String> prices = goodsMapper.selectPrice(orderItemsIds);
		double totalPrice = 0;
		for (int i = 0; i < prices.size(); i++) {
			totalPrice += Double.parseDouble(prices.get(i)) * Integer.parseInt(quantity[i]);
		}
		System.out.println("Total price: " + totalPrice);

		// 封装订单详情
		List<OrderItem> orderItems = new ArrayList<>();
		for (int i = 0; i < selectedGoods.length; i++) {
			String selectedGood = selectedGoods[i];
			String itemQuantity = quantity[i];
			OrderItem orderItem = new OrderItem(selectedGood, orderCodeStr, itemQuantity);
			orderItems.add(orderItem);
		}

		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.insertOrderDetail(orderItems);
		orderMapper.insertOrder(orderCodeStr, username, String.valueOf(totalPrice));

		req.getRequestDispatcher("/order_page.jsp").forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
