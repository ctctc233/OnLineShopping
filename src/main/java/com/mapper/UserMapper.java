package com.mapper;

import com.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper {
	@Select("SELECT * FROM user WHERE account = #{account} AND password = #{password}")
	@Result(property = "userImg", column = "user_avatar")
	User selectUser(@Param("account") String account, @Param("password") String password);

	void updateUser(@Param("username") String username, @Param("password") String password);

	@Update("UPDATE user SET user_avatar = #{userImg} WHERE account = #{userId}")
	void avatarUpload(@Param("userImg") String userImg, @Param("userId") String userId);
}

