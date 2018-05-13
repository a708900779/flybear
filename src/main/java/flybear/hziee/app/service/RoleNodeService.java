package flybear.hziee.app.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import flybear.hziee.app.mapper.RoleNodeMapper;
import flybear.hziee.app.model.RoleNode;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.mybatis.SqlRunner;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.sql.SQLBuilder;

@Service
@Transactional
public class RoleNodeService {

	@Autowired
	private RoleNodeMapper mapper;
	
	@Autowired
	private SqlRunner sqlRunner;
	
	@Autowired
	private ActionNodeService actionNodeService;
	
	public Integer delete(Integer id){
		return mapper.deleteByPrimaryKey(id);
	}
	
	public Integer deleteByRoleId(Integer id){
		return mapper.deleteByRoleId(id);
	}
	
	public Integer update(RoleNode entity) throws Exception{
		
		return mapper.updateByPrimaryKey(entity);
	}
	
	public Integer save(RoleNode entity) throws Exception{
		
		return mapper.insert(entity);
	}
	
	public List<RoleNode> findAll() {
		return mapper.selectAll();
	}
	
	public RoleNode findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	
	public Map<String, Object> getUIGridData(Map<String, Object> where, Map<String, String> pageMap) {
		SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(RoleNode.class);
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
	
	public boolean findByRoleId(Integer roleId, Integer nodeId) {
		SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(RoleNode.class);
		String sql = sqlBuilder
				.fields("*")
				.where("role_id="+roleId)
				.where("node_id="+nodeId)
				.selectSql();
		return sqlRunner.select(sql).isEmpty();
	}
	
//	public List<Row> findByRole(Integer roleId){
//		SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(RoleNode.class);
//		String sql = sqlBuilder
//				.fields("*")   //这里约定前端grid需要显示多少个具体列，也可以全部*
//				.where("role_id = "+roleId)
//				.order("id", "asc")
//				.selectSql();
//		List<Row> list = sqlRunner.select(sql);
//		for(Row row : list){
//			ActionNode actionNode = actionNodeService.findById(Integer.valueOf(row.get("nodeId").toString()));
//			row.put("url", actionNode.getUrl());
//		}
//		return list;
//	}
}
