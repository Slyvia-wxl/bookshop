package user.dao;
/**
 * UserDao需要使用TxQueryRunner来完成对数据库的操作。
 */
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import user.domain.User;
import cn.itcast.jdbc.TxQueryRunner;

public class UserDao {
	private QueryRunner qr = new TxQueryRunner();
	
	public boolean ajaxValidateLoginname(String loginname) throws SQLException{
		String sql = "select count(1) from t_user where loginname=?";
		Number number = (Number)qr.query(sql, new ScalarHandler(), loginname);
		return number.intValue() == 0;
	}
	
	public boolean ajaxValidateEmail(String email) throws SQLException{
		String sql = "select count(1) from t_user where email=?";
		Number number = (Number)qr.query(sql, new ScalarHandler(), email);
		return number.intValue() == 0;
	}
	
	public void add(User user) throws SQLException {
		String sql = "insert into t_user values(?,?,?,?,?,?)";
		Object[] params = {user.getUid(), user.getLoginname(), user.getLoginpass(),
				user.getEmail(), user.isStatus(), user.getActivationCode()};
		qr.update(sql, params);
	}
	
	public User findByLoginnameAndLoginpass(String loginname, String loginpass) throws SQLException {
		String sql = "select * from t_user where loginname=? and loginpass=?";
		System.out.println(qr.query(sql, new BeanHandler<User>(User.class), loginname,loginpass));
		return qr.query(sql, new BeanHandler<User>(User.class), loginname, loginpass);
	}
}
