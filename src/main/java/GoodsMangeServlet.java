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
import java.util.List;

@WebServlet("/GoodsMangeServlet")
public class GoodsMangeServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		// 分页数据
		int currentPage = 1;
		int limit = 10;
		if (req.getParameter("currentPage")!= null) {
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
		}
		// 获取搜索关键字
		String searchKeyword = req.getParameter("searchKeyword");

		// 读取mybatis-config.xml配置文件
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建SqlSessionFactory工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);

		// 查询商品列表
		List<Goods> goodsList;
		int total;
		// 如果搜索关键字不为空，则按名称搜索
		if (searchKeyword != null) {
			goodsList = goodsMapper.searchGoodsByName(searchKeyword, (currentPage - 1) * limit, limit);
			total = goodsMapper.searchGoodsByNameCount(searchKeyword);
		} else {
			// 否则查询所有商品
			goodsList = goodsMapper.searchGoodsList((currentPage - 1) * limit, limit);
			total = goodsMapper.selectCountGoods();
		}
		for (Goods goods : goodsList) {
			System.out.println(goods);
		}

		// 设置总记录数
		int pageCount = total / limit;
		if (total % limit > 0) {
			pageCount++;
		}
		// 设置总页数
		req.setAttribute("pageCount", pageCount);
		// 设置当前页码
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("goods_mange.jsp").forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
