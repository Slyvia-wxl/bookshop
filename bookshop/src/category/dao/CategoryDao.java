package category.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import category.domain.Category;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class CategoryDao {
	private QueryRunner qr = new TxQueryRunner();
	
	public void delete(String cid) throws SQLException {
		String sql = "delete from t_category where cid=?";
		qr.update(sql, cid);
	}
	
	public int findChildrenCountByParent(String pid) throws SQLException {
		String sql = "select count(*) from t_category where pid=?";
		Number cnt = (Number)qr.query(sql, new ScalarHandler(), pid);
		return cnt == null ? 0 : cnt.intValue();
	}
	
	public void edit(Category category) throws SQLException {
		String sql = "update t_category set cname=?, pid=?, `desc`=? where cid=?";
		String pid = null;
		if(category.getParent() != null) {
			pid = category.getParent().getCid();
		}
		Object[] params = {category.getCname(), pid, category.getDesc(), category.getCid()};
		qr.update(sql, params);
	}
	
	public Category load(String cid) throws SQLException {
		String sql = "select * from t_category where cid=?";
		return toCategory(qr.query(sql, new MapHandler(), cid));
	}
	
	public List<Category> findParents() throws SQLException {
		String sql = "select * from t_category where pid is null order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
		
		return toCategoryList(mapList);
	}
	
	public void add(Category category) throws SQLException {
		String sql = "insert into t_category(cid,cname,pid,`desc`) values(?,?,?,?)";
		String pid = null;
		if(category.getParent() != null) {
			pid = category.getParent().getCid();
		}
		Object[] params = {category.getCid(), category.getCname(), pid, category.getDesc()};
		qr.update(sql, params);
	}
	
	private Category toCategory(Map<String,Object> map) {
		Category category = CommonUtils.toBean(map, Category.class);
		String pid = (String)map.get("pid");
		if(pid != null) {
			Category parent = new Category();
			parent.setCid(pid);
			category.setParent(parent);
		}
		return category;
	}
	
	private List<Category> toCategoryList(List<Map<String,Object>> mapList) {
		List<Category> categoryList = new ArrayList<Category>();
		for(Map<String,Object> map : mapList) {
			Category c = toCategory(map);
			categoryList.add(c);
		}
		return categoryList; 
	}
	
	public List<Category> findAll() throws SQLException {
		/*
		 * 1. 获取所有一级分类
		 */
		String sql = "select * from t_category where pid is null order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
		/*
		 * 2. 循环遍历每个一级分类，为其加载它的所有二级分类
		 */
		List<Category> parents = toCategoryList(mapList);
		for(Category parent : parents) {
			List<Category> children = findByParent(parent.getCid());// 获取当前一级分类的所有二级分类
			parent.setChildren(children);// 给当前一级分类设置二级分类
		}
		return parents;
	}
	
	public List<Category> findByParent(String pid) throws SQLException {
		String sql = "select * from t_category where pid=? order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(), pid);
		return toCategoryList(mapList);
	}

}
