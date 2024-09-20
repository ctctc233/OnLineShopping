package com.mapper;

import com.pojo.ShoppingCart;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface SpCartMapper {
	List<ShoppingCart> selectCartByUserId(Map<String, Object> params);

	@Select("select count(*) from shopping_cart")
	int selectCountShoppingCart();

	@Insert("insert into shopping_cart(account, sp_goods_id) values(#{userId}, #{productId})")
	void insertCart(@Param("userId") String userId, @Param("productId") String productId);

	@Delete("delete from shopping_cart where sp_cart_id = #{cartId}")
	void deleteCart(String cartId);
}
