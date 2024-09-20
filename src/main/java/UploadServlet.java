import com.mapper.GoodsMapper;
import com.mapper.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


@WebServlet("/UploadServlet")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024, // 1 MB
		maxFileSize = 1024 * 1024 * 10,  // 10 MB
		maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
		if (action.equals("goodsImg")) {
			goodsUpload(req, resp);
		} else if (action.equals("avatar")) {
			avatarUpload(req, resp);
		}
	}

	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	private void goodsUpload(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String fileName = uploadFile(req, resp);
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");

		//存入数据库
		// 读取mybatis-config.xml配置文件
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建SqlSessionFactory工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
		goodsMapper.imgUpload(id, fileName);
	}

	private void avatarUpload(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String fileName = uploadFile(req, resp);

		//存入数据库
		// 读取mybatis-config.xml配置文件
		String resource = "mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建SqlSessionFactory工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		userMapper.avatarUpload(fileName, (String) req.getSession().getAttribute("name"));
	}

	private String uploadFile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		Part filePart = req.getPart("upload");
		System.out.println("filePart: " + filePart);
		String fileName = getFileName(filePart);
		System.out.println("fileName: " + fileName);

		String uploadPath = "E:\\IDEA\\idea code\\OnLineSopping\\src\\main\\webapp\\img";
		System.out.println("uploadPath: " + uploadPath);
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) uploadDir.mkdirs();

		try (InputStream input = filePart.getInputStream()) {
			FileOutputStream output = new FileOutputStream(new File(uploadDir, fileName));
			byte[] buffer = new byte[1024];
			int length;
			while ((length = input.read(buffer)) > 0) {
				output.write(buffer, 0, length);
			}
			output.close();
		}
		return fileName;
	}
}
