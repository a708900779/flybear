package flybear.hziee.app.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import flybear.hziee.app.mapper.UserMapper;
import flybear.hziee.app.model.Role;
import flybear.hziee.app.model.User;
import flybear.hziee.app.model.UserRole;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.mybatis.SqlRunner;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.sql.SQLBuilder;


@Service
public class UserService {

    @Autowired
    private UserMapper mapper;
    
    @Autowired
	private SqlRunner sqlRunner;

    public Integer delete(Integer id){
        return mapper.deleteByPrimaryKey(id);
    }
    
    public User findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	public Integer update(User entity) throws Exception{
		return mapper.updateByPrimaryKey(entity);
	}

    public Integer save(User entity) {
        return mapper.insert(entity);
    }

    public Map<String, Object> getUIGridData(Map<String, Object> where, Map<String, String> pageMap) {
        SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(User.class);
        String sql = sqlBuilder
                .fields("User.id AS id,User.name AS name,password AS password,real_name AS realName,phone AS phone,Role.name as roleName")   //这里约定前端grid需要显示多少个具体列，也可以全部*
                .where(where)
                .parseUIPageAndOrder(pageMap)
                .join(UserRole.class, "User.id = UserRole.user_id")
                .join(Role.class, "UserRole.role_id = Role.id")
                .order("id", "asc")
                .selectSql();
        List<Row> list = sqlRunner.select(sql);

        String countSql = sqlBuilder.fields("count(*)").where(where).selectSql();
        Integer count = sqlRunner.count(countSql);
        return UIUtils.getGridData(count, list);
    }
    
	public boolean checkLogin(String loginName, String loginPwd){
		HashMap<String, Object> where  = new HashMap<String,Object>();
		where.put("name", loginName);
		where.put("password",loginPwd);
		SQLBuilder sb = SQLBuilder.getSQLBuilder(User.class);
		String sql = sb.fields("*").where(where).selectSql();
		List<Row> list = sqlRunner.select(sql);
		if(list.size()>0){ 
			return true;
		}
		else
			return false;
	}
    
	public boolean userIsExist(String key){
			SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(User.class);
			String sql = sqlBuilder.fields("*").where("key='"+key+"'").selectSql();
			List<Row> list = sqlRunner.select(sql);
			if(list.size()==0){
				return false;
			}else{
				return true;
			}
		}
	public Row Userinfo(String loginName, String loginPwd){
		String sql = SQLBuilder.getSQLBuilder(User.class)
				.fields("User.id AS id,User.name AS name,password AS password,real_name AS realName,phone AS phone,UserRole.role_id as roleId")   //这里约定前端grid需要显示多少个具体列，也可以全部*
				.where("name ='"+loginName+"' and password ='"+loginPwd+"'")
				.join(UserRole.class,"User.id = UserRole.user_id")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		return list.get(0);
	}
	
	public Row getInfoByid(String id){
		String sql = SQLBuilder.getSQLBuilder(User.class)
				.fields("User.id AS id,User.name AS name,password AS password,real_name AS realName,phone AS phone,Role.name as roleName")   //这里约定前端grid需要显示多少个具体列，也可以全部*
				.where("User.id="+id)
				.join(UserRole.class,"User.id = UserRole.user_id")
				.join(Role.class,"UserRole.role_id = Role.id")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		return list.get(0);
	}
	
}
