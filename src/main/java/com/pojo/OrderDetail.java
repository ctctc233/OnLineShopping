package com.pojo;

public class OrderDetail {
	private int goodsId;
	private String orderCode;
	private String goodsNum;
	private Goods goods;

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@Override
	public String toString() {
		return "OrderDetail{" +
				"goodsId=" + goodsId +
				", orderCode='" + orderCode + '\'' +
				", goodsNum='" + goodsNum + '\'' +
				", goods=" + goods +
				'}';
	}
}
