import com.mapper.GoodsMapper;
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

// 处理商品修改请求
@WebServlet("/GoodsChangeServlet")
public class GoodsChangeServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		// 获取参数
		HttpSession session = req.getSession();
		int goodsId = (int) session.getAttribute("id");
		String goodsName = req.getParameter("goodsName");
		String goodsPrice = req.getParameter("goodsPrice");
		String goodsDetail = req.getParameter("goodsDetail");

		// 读取mybatis-config.xml配置文件
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建SqlSessionFactory工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
		goodsMapper.updateGoods(goodsId, goodsName, goodsPrice, goodsDetail);
		sqlSession.commit();
		sqlSession.close();
		inputStream.close();

		req.getRequestDispatcher("GoodsMangeServlet").forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
