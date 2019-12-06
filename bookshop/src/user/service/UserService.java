package user.service;
/**
 * UserService��װ��ҵ���ܣ���UserService��ÿ��������Ӧһ��ҵ���ܣ����磺ע�᷽������¼�����ȵȡ�
 * һ��ҵ�񷽷�������Ҫ��ε���DAO�еķ���
 */
import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;

import cn.itcast.commons.CommonUtils;
import user.domain.User;
import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;
import user.dao.UserDao;

public class UserService {
	private UserDao userDao = new UserDao();
	
	public User login(User user) {
		try {
			return userDao.findByLoginnameAndLoginpass(user.getLoginname(), user.getLoginpass());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean ajaxValidateLoginname(String loginname){
		try{
			return userDao.ajaxValidateLoginname(loginname);
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public boolean ajaxValidateEmail(String email){
		try{
			return userDao.ajaxValidateEmail(email);
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public void regist(User user) {
		/*
		 * 1. ���ݲ���
		 */
		user.setUid(CommonUtils.uuid());
		user.setStatus(false);
		user.setActivationCode(CommonUtils.uuid() + CommonUtils.uuid());
		/*
		 * 2. �����ݿ����
		 */
		try {
			userDao.add(user);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
