package flybear.hziee.app.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flybear.hziee.app.mapper.BaomingMapper;
import flybear.hziee.app.model.Activity;
import flybear.hziee.app.model.Baoming;
import flybear.hziee.app.model.User;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.mybatis.SqlRunner;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.sql.SQLBuilder;
import flybear.hziee.core.util.Fn;


@Service
public class BaomingService {

    @Autowired
    private BaomingMapper mapper;
    
    @Autowired
	private SqlRunner sqlRunner;

	/**
     * 查找所有
     * @return List<Baoming>
     */
    public List<Baoming> findAll() {
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
    public Baoming findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	/**
     * 更新
     * @param entity
     * @return
     * @throws Exception
     */
	public Integer update(Baoming entity) throws Exception{
		return mapper.updateByPrimaryKey(entity);
	}

	/**
	 * 保存
	 * @param entity
	 * @return
	 */
    public Integer save(Baoming entity) {
        return mapper.insert(entity);
    }

	/**
     * 得到一页数据记录
     * @param where 条件
     * @param pageMap 分页参数
     * @return
     */
    public Map<String, Object> getUIGridData(Map<String, Object> where, Map<String, String> pageMap) {
        SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Baoming.class);
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
		SQLBuilder sb = SQLBuilder.getSQLBuilder(Baoming.class);
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
	public boolean baomingIsExist(String key){
			SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Baoming.class);
			String sql = sqlBuilder.fields("*").where("key='"+key+"'").selectSql();
			List<Row> list = sqlRunner.select(sql);
			if(list.size()==0){
				return false;
			}else{
				return true;
			}
		}
	/**
     * 根据activity_id查询已活动的人数。
     * @param key
     * @return
     */
	public int getAcNum(int  acid){
			SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Baoming.class);
			String sql = sqlBuilder
					.fields("*")
					.where("activity_id='"+acid+"'")
					.selectSql();
			List<Row> list = sqlRunner.select(sql);
			
			return list.size();
		}
	 /**
     * 根据参数值判断是否已经报名，如果已经报名，则返回flase
     * @param key
     * @return
     */
	public boolean IsExist(int acid,int stuid){
		HashMap<String, Object> where  = new HashMap<String,Object>();
		where.put("activity_id", acid);
		where.put("student_id",stuid);
		SQLBuilder sb = SQLBuilder.getSQLBuilder(Baoming.class);
		String sql = sb.fields("*").where(where).selectSql();
		List<Row> list = sqlRunner.select(sql);
		if(list.size()>0){ 
			return false;
		}
		else
			return true;
		}
	/**
     * 根据学生id获取该学生报名的所有活动。
     * @param key
     * @return
     */
	public List getAcByStuid(int stuid){
		HashMap<String, Object> where  = new HashMap<String,Object>();
		where.put("student_id",stuid);
		SQLBuilder sb = SQLBuilder.getSQLBuilder(Baoming.class);
		String sql = sb.fields("*").where(where).selectSql();
		List<Row> list = sqlRunner.select(sql);//获得已报名活动的id
		
		List<Row> list1 = new ArrayList();
		
		for(int i =0;i<list.size();i++){		
			list1.add(getActivity(list.get(i).getInt("activityId")));			
		}
		
		return list1;
	}

	public Row getActivity(Integer id) {
		SQLBuilder sb = SQLBuilder.getSQLBuilder(Activity.class);
		String sql = sb.fields("*").where("id ='"+id+"'").selectSql();
		List<Row> list = sqlRunner.select(sql);//获得已报名活动的id
		return list.get(0);
	}
	
}
