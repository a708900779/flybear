package flybear.hziee.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flybear.hziee.app.mapper.UserRoleMapper;
import flybear.hziee.app.model.User;
import flybear.hziee.app.model.UserRole;
import flybear.hziee.core.mybatis.SqlRunner;
import flybear.hziee.core.sql.SQLBuilder;

@Service
@Transactional
public class UserRoleService {

	@Autowired
	private UserRoleMapper mapper;
	
	@Autowired
	private SqlRunner sqlRunner;
	
	public Integer delete(Integer id){
		return mapper.deleteByPrimaryKey(id);
	}
	
	public Integer update(UserRole entity) throws Exception{
		
		return mapper.updateByPrimaryKey(entity);
	}
	
	public Integer save(UserRole entity) throws Exception{
		
		return mapper.insert(entity);
	}
	
	public List<UserRole> findAll() {
		return mapper.selectAll();
	}
	
	public UserRole findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 通过用户id更新权限id
	 * @param userid
	 * @param roleid
	 * @return
	 */
	public boolean updataRole(String userid,String roleid){
		String upsql = "UPDATE x_user_role SET role_id = "+roleid+" WHERE user_id = "+userid;
		Integer i = sqlRunner.update(upsql);
		if(i > 0)
			return true;
		else
			return false;
	}
	
	/**
	 * 通过用户id删除节点
	 * @param id
	 */
	public void deleteByuserid(String id){
		String delsql = "delete from x_user_role where user_id = "+id;
		sqlRunner.delete(delsql);
	}
	
}
