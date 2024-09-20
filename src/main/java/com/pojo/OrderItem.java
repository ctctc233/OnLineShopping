package com.pojo;

public class OrderItem {
	private String goodsId;
	private String orderCode;
	private String goodsCount;

	public OrderItem(String goodsId, String orderCode, String goodsCount) {
		this.goodsId = goodsId;
		this.orderCode = orderCode;
		this.goodsCount = goodsCount;
	}

	public OrderItem(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsCount() {
		return goodsCount;
	}

	public void setGoodsCount(String goodsCount) {
		this.goodsCount = goodsCount;
	}

	// Getters and setters
	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	@Override
	public String toString() {
		return "OrderItem{" +
				"goodsId='" + goodsId + '\'' +
				", orderCode='" + orderCode + '\'' +
				", goodsCount='" + goodsCount + '\'' +
				'}';
	}
}

