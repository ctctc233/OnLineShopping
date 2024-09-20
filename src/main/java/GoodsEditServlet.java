import com.mapper.GoodsMapper;
import com.pojo.Goods;
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

// 商品增删改查
@WebServlet("/GoodsEditServlet")
public class GoodsEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		String btn = req.getParameter("btn");
		int id = Integer.parseInt(req.getParameter("id"));
		// 读取mybatis-config.xml配置文件
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建SqlSessionFactory工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
		// 单条商品信息查询
		Goods goods = goodsMapper.searchGoods(id);
		System.out.println(goods);
		HttpSession session = req.getSession();
		session.setAttribute("goods", goods);
		session.setAttribute("id", id);
		// 编辑商品信息
		if (btn.equals("编辑")) {
			req.getRequestDispatcher("goods_edit.jsp").forward(req, resp);
		}else if (btn.equals("删除")) {
			goodsMapper.deleteGoods(id);
			req.getRequestDispatcher("goods_mange.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
