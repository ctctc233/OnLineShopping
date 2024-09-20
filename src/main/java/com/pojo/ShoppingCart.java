package com.pojo;

import java.util.List;

public class ShoppingCart {
	private int spCartId;
	private String spName;
	private String spGoodsId;
	private Goods spGoods;

	public Goods getSpGoods() {
		return spGoods;
	}

	public void setSpGoods(Goods spGoods) {
		this.spGoods = spGoods;
	}

	public int getSpCartId() {
		return spCartId;
	}

	public void setSpCartId(int spCartId) {
		this.spCartId = spCartId;
	}

	public String getSpName() {
		return spName;
	}

	public void setSpName(String spName) {
		this.spName = spName;
	}

	public String getSpGoodsId() {
		return spGoodsId;
	}

	public void setSpGoodsId(String spGoodsId) {
		this.spGoodsId = spGoodsId;
	}

	@Override
	public String toString() {
		return "ShoppingCart{" +
				"spCartId=" + spCartId +
				", spName='" + spName + '\'' +
				", spGoodsId='" + spGoodsId + '\'' +
				", spGoods=" + spGoods +
				'}';
	}
}
