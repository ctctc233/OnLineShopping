package com.pojo;

public class PlaceOrder {
	private int orderId;
	private String orderCode;
	private String userId;
	private String date;
	private String totalPrice;
	private boolean isPay;
	private boolean isSend;

	public boolean getIsSend() {
		return isSend;
	}

	public void setSend(boolean send) {
		isSend = send;
	}

	public boolean getIsPay() {
		return isPay;
	}

	public void setPay(boolean pay) {
		isPay = pay;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "PlaceOrder{" +
				"orderId=" + orderId +
				", orderCode='" + orderCode + '\'' +
				", userId='" + userId + '\'' +
				", date='" + date + '\'' +
				", totalPrice='" + totalPrice + '\'' +
				", isPay=" + isPay +
				", isSend=" + isSend +
				'}';
	}
}
