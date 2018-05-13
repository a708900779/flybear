package flybear.hziee.app.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flybear.hziee.app.mapper.StudentMapper;
import flybear.hziee.app.model.Student;
import flybear.hziee.app.model.User;
import flybear.hziee.app.model.UserRole;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.mybatis.SqlRunner;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.sql.SQLBuilder;
import flybear.hziee.core.util.Fn;


@Service
public class StudentService {

    @Autowired
    private StudentMapper mapper;
    
    @Autowired
	private SqlRunner sqlRunner;

	/**
     * 查找所有
     * @return List<Student>
     */
    public List<Student> findAll() {
        return mapper.selectAll();
    }

	/**
     * 根据ID删除
     * @param id
     * @return 
     */
    public Integer delete(Integer id){
        return mapper.deleteByPrimaryKey(id);
    }
    
    /**
     * 根据ID查找
     * @param id
     * @return
     */
    public Student findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	/**
     * 更新
     * @param entity
     * @return
     * @throws Exception
     */
	public Integer update(Student entity) throws Exception{
		return mapper.updateByPrimaryKey(entity);
	}

	/**
	 * 保存
	 * @param entity
	 * @return
	 */
    public Integer save(Student entity) {
        return mapper.insert(entity);
    }

	/**
     * 得到一页数据记录
     * @param where 条件
     * @param pageMap 分页参数
     * @return
     */
    public Map<String, Object> getUIGridData(Map<String, Object> where, Map<String, String> pageMap) {
        SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Student.class);
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
    
    /**
     * 得到一页数据记录
     * @param key
     * @param pageMap
     * @return
     */
     public Map<String, Object> findUIGridData(String key,Map<String,String> pageMap) {
		String where = "id like '%"+key+"%'";
		SQLBuilder sb = SQLBuilder.getSQLBuilder(Student.class);
		String sql = sb.fields("*")
				.where(where)
				.parseUIPageAndOrder(pageMap)
				.order("id", "desc")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		/*
		for(Row row : list){
	        	row.put("addTime", Fn.date(row.getInt("addTime"), "yyyy-MM-dd HH:mm:ss"));
	    }*/
		String countSql = sb.fields("count(*)").where(where).selectSql();
		Integer count = sqlRunner.count(countSql);

		return UIUtils.getGridData(count, list);
	}
    
    /**
      * 根据参数值判断是否存在
      * @param key
      * @return
      */
	public boolean studentIsExist(String key){
			SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Student.class);
			String sql = sqlBuilder.fields("*").where("key='"+key+"'").selectSql();
			List<Row> list = sqlRunner.select(sql);
			if(list.size()==0){
				return false;
			}else{
				return true;
			}
		}
	public boolean checkLogin(String studentid, String password){
		HashMap<String, Object> where  = new HashMap<String,Object>();
		where.put("student_id", studentid);
		where.put("password",password);
		SQLBuilder sb = SQLBuilder.getSQLBuilder(Student.class);
		String sql = sb.fields("*").where(where).selectSql();
		List<Row> list = sqlRunner.select(sql);
		if(list.size()>0){ 
			return true;
		}
		else
			return false;
	}
	/*public Row Studentinfo(String loginName, String loginPwd){
		String sql = SQLBuilder.getSQLBuilder(User.class)
				.fields("User.id AS id,User.name AS name,password AS password,real_name AS realName,phone AS phone,UserRole.role_id as roleId")   //这里约定前端grid需要显示多少个具体列，也可以全部*
				.where("name ='"+loginName+"' and password ='"+loginPwd+"'")
				.join(UserRole.class,"User.id = UserRole.user_id")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		return list.get(0);
	}*/
	public String getByStudentId(int student_id){
		String sql = SQLBuilder.getSQLBuilder(Student.class)
				.fields("*")
				.where("student_id ='"+student_id+"'")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		System.out.println(list.get(0).getString("studentName"));
		return list.get(0).getString("studentName");
	}
	public int getByNickname(String stuname){
		String sql = SQLBuilder.getSQLBuilder(Student.class)
				.fields("*")
				.where("student_name ='"+stuname+"'")
				.selectSql();
		List<Row> list = sqlRunner.select(sql);
		System.out.println(list.get(0).getInt("id"));
		return list.get(0).getInt("id");
	}
	
	
	
}
