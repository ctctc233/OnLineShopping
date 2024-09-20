package com.pojo;

public class User {
	private String name;
	private String password;
	private int role;
	private String userImg;

	public User(String name, String password, int role, String userImg) {
		this.name = name;
		this.password = password;
		this.role = role;
		this.userImg = userImg;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User{" +
				"name='" + name + '\'' +
				", password='" + password + '\'' +
				", role=" + role +
				", userImg='" + userImg + '\'' +
				'}';
	}
}
