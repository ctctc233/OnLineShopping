package com.mapper;

import com.pojo.Goods;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GoodsMapper {
	@Select("SELECT * FROM goods WHERE goods_id = #{id}")
	@Result(property = "id", column = "goods_id")
	@Result(property = "name", column = "goods_name")
	@Result(property = "goodsDetail", column = "goods_detail")
	Goods searchGoods(int id);

	// 查询商品列表
	@Select("SELECT * FROM goods LIMIT #{offset}, #{limit}")
	@Result(property = "id", column = "goods_id")
	@Result(property = "name", column = "goods_name")
	@Result(property = "goodsDetail", column = "goods_detail")
	List<Goods> searchGoodsList(@Param("offset") int offset, @Param("limit") int limit);

	// 查询商品总数
	@Select("select count(*) from goods")
	int selectCountGoods();

	// 按商品名称模糊查询
	@Select("SELECT * FROM goods WHERE goods_name LIKE CONCAT('%', #{name}, '%') LIMIT #{offset}, #{limit}")
	@Result(property = "id", column = "goods_id")
	@Result(property = "name", column = "goods_name")
	@Result(property = "goodsDetail", column = "goods_detail")
	List<Goods> searchGoodsByName(@Param("name") String name, @Param("offset") int offset, @Param("limit") int limit);

	// 按商品名称模糊查询总数
	@Select("SELECT COUNT(*) FROM goods WHERE goods_name LIKE CONCAT('%', #{name}, '%')")
	int searchGoodsByNameCount(@Param("name") String name);

	// 修改商品
	@Update("UPDATE goods SET goods_name = #{name}, price = #{price}, goods_detail = #{detail} WHERE goods_id = #{id}")
	void updateGoods(@Param("id") int id, @Param("name") String name, @Param("price") String price, @Param("detail") String detail);

	// 删除商品
	@Delete("DELETE FROM goods WHERE goods_id = #{id}")
	void deleteGoods(int id);

	// 新增商品
	@Insert("INSERT INTO goods (goods_name, price, goods_detail) VALUES (#{name}, #{price}, #{detail})")
	void addGoods(@Param("name") String name, @Param("price") String price, @Param("detail") String detail);

	// 查询商品单价
	List<String> selectPrice(@Param("ids") List<String> ids);

	@Update("UPDATE goods SET image = #{imgUrl} WHERE goods_id = #{id}")
	void imgUpload(@Param("id") int id,@Param("imgUrl") String imgUrl);
}
