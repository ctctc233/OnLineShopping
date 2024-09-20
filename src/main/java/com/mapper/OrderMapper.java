package com.mapper;

import com.pojo.OrderDetail;
import com.pojo.OrderItem;
import com.pojo.PlaceOrder;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
	// 订单详情表插入订单
	void insertOrderDetail(List<OrderItem> orderItem);

	// 订单表插入订单
	@Insert("insert into place_order(order_code, user_id, total_price) values(#{order_code}, #{user_id}, #{total_price})")
	void insertOrder(@Param("order_code") String order_code, @Param("user_id") String user_id, @Param("total_price") String total_price);

	// 用户订单列表
	@Select("select * from place_order where user_id = #{user_id} ORDER BY date DESC limit #{offset}, #{limit}")
	@Result(property = "orderId", column = "order_id")
	@Result(property = "orderCode", column = "order_code")
	@Result(property = "userId", column = "user_id")
	@Result(property = "date", column = "date")
	@Result(property = "totalPrice", column = "total_price")
	@Result(property = "isPay", column = "is_pay")
	@Result(property = "isSend", column = "is_send")
	List<PlaceOrder> selectPlaceOrder(@Param("user_id") String user_id, @Param("offset") int offset, @Param("limit") int limit);

	// 用户订单总数
	@Select("select count(*) from place_order where user_id = #{user_id}")
	int selectPlaceOrderCount(@Param("user_id") String user_id);

	// 管理员订单列表（所有）
	@Select("select * from place_order ORDER BY date DESC limit #{offset}, #{limit}")
	@Result(property = "orderId", column = "order_id")
	@Result(property = "orderCode", column = "order_code")
	@Result(property = "userId", column = "user_id")
	@Result(property = "date", column = "date")
	@Result(property = "totalPrice", column = "total_price")
	@Result(property = "isPay", column = "is_pay")
	@Result(property = "isSend", column = "is_send")
	List<PlaceOrder> selectAllPlaceOrder(@Param("offset") int offset, @Param("limit") int limit);

	// 管理员订单总数
	@Select("select count(*) from place_order")
	int selectAllPlaceOrderCount();

	@Delete("delete from place_order where order_code = #{orderCode}")
	void deleteOrder(String orderCode);

	List<OrderDetail> selectOrderIdDetail(Map<String, Object> params);

	@Select("select count(*) from order_detail where order_code = #{orderCode}")
	int selectOrderIdDetailCount(String orderCode);

	@Update("update place_order set is_pay = 1 where order_code = #{order_code}")
	void updateOrderPayStatus(String order_code);

	// 管理员发货
	@Update("update place_order set is_send = 1 where order_code = #{order_code}")
	void updateOrderSendStatus(String order_code);
}
