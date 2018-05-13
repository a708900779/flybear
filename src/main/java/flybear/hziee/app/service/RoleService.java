package flybear.hziee.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flybear.hziee.app.mapper.RoleMapper;
import flybear.hziee.app.model.Role;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.mybatis.SqlRunner;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.sql.SQLBuilder;

@Service
@Transactional
public class RoleService {

	@Autowired
	private RoleMapper mapper;
	
	@Autowired
	private SqlRunner sqlRunner;
	
	
	public Integer delete(Integer id){
		return mapper.deleteByPrimaryKey(id);
	}
	
	public Integer update(Role entity) throws Exception{
		
		return mapper.updateByPrimaryKey(entity);
	}
	
	public Integer save(Role entity) throws Exception{
		
		return mapper.insert(entity);
	}
	
	public List<Role> findAll() {
		return mapper.selectAll();
	}
	
	public Role findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	
	public Map<String, Object> getUIGridData(Map<String, Object> where, Map<String, String> pageMap) {
		SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Role.class);
		String sql = sqlBuilder
				.fields("*")   //这里约定前端grid需要显示多少个具体列，也可以全部*
				.where(where)
				.parseUIPageAndOrder(pageMap)
				.order("id", "asc")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);

		String countSql = sqlBuilder.fields("count(*)").where(where).selectSql();
		Integer count = sqlRunner.count(countSql);
		return UIUtils.getGridData(count, list);
	}
	
	public List<Row> getList(Map<String, Object> where) {
		SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Role.class);
		String sql = sqlBuilder
				.fields("id,name as text")   //这里约定前端grid需要显示多少个具体列，也可以全部*
//				.where("type = 0")
				.order("id", "asc")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		System.out.println(where);
		return list;
	}
	
	public List<Row> getRoleLists(Map<String, Object> where) {
		SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Role.class);
		String sql = sqlBuilder
				.fields("id,name as text")   //这里约定前端grid需要显示多少个具体列，也可以全部*
				.where(where)
				.order("id", "asc")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		return list;
	}
	
	
	public List<Row> getRoleListsByRoleId(int roleId) {
		String where = "";
		switch (roleId) {
		case 1: 
			break;
		case 4:  where = " 1 = 0";
			break;
		case 5:  where = "id = 4 ";
			break;
		case 6:  where = "id = 4";
			break;
		default: where = " 1 = 0";
			break;
		}
		SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Role.class);
		String sql = sqlBuilder
				.fields("id,name as text")   //这里约定前端grid需要显示多少个具体列，也可以全部*
				.where(where)
				.order("id", "asc")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		return list;
	}
	
	public List<Row> getRoleListsByRoleIdEdit(int roleId) {
		String where = "";
		switch (roleId) {
		case 1: 
			break;
		case 4:  where = "id = 4";
			break;
		case 5:  where = "id = 4 or id = 5 ";
			break;
		case 6:  where = "id = 4 or id = 6";
			break;
		default: where = " 1 = 0";
			break;
		}
		SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Role.class);
		String sql = sqlBuilder
				.fields("id,name as text")   //这里约定前端grid需要显示多少个具体列，也可以全部*
				.where(where)
				.order("id", "asc")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		return list;
	}
	
}
