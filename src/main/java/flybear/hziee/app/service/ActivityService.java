package flybear.hziee.app.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flybear.hziee.app.mapper.ActivityMapper;
import flybear.hziee.app.model.Activity;
import flybear.hziee.app.model.Baoming;
import flybear.hziee.app.util.Page;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.mybatis.SqlRunner;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.sql.SQLBuilder;
import flybear.hziee.core.util.Fn;


@Service
public class ActivityService {

    @Autowired
    private ActivityMapper mapper;
    
    @Autowired
	private SqlRunner sqlRunner;

	/**
     * 查找所有
     * @return List<Activity>
     */
    public List<Activity> findAll() {
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
    public Activity findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	/**
     * 更新
     * @param entity
     * @return
     * @throws Exception
     */
	public Integer update(Activity entity) throws Exception{
		return mapper.updateByPrimaryKey(entity);
	}

	/**
	 * 保存
	 * @param entity
	 * @return
	 */
    public Integer save(Activity entity) {
        return mapper.insert(entity);
    }

	/**
     * 得到一页数据记录
     * @param where 条件
     * @param pageMap 分页参数
     * @return
     */
    public Map<String, Object> getUIGridData(Map<String, Object> where, Map<String, String> pageMap) {
        SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Activity.class);
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
		SQLBuilder sb = SQLBuilder.getSQLBuilder(Activity.class);
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
	public boolean activityIsExist(String key){
			SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Activity.class);
			String sql = sqlBuilder.fields("*").where("key='"+key+"'").selectSql();
			List<Row> list = sqlRunner.select(sql);
			if(list.size()==0){
				return false;
			}else{
				return true;
			}
		}
	public Page getList(int page,int rows){
		SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Activity.class);
		String sql = sqlBuilder.fields("*")
					 .page(page,rows)
					 .order("id", "asc")
					 .selectSql();
		List<Row> list = sqlRunner.select(sql);
		System.out.println(list);
		String countSql = sqlBuilder.fields("count(*)").selectSql();
		Integer count = sqlRunner.count(countSql);
		return new Page(page,rows,count,list);
		
	}
	/**
     * 根据申请人名字查询已申请的活动。
     * @param key
     * @return
     */
	public List getAcByName(String  name){
			SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Activity.class);
			String sql = sqlBuilder
					.fields("*")
					.where("applicant='"+name+"'")
					.selectSql();
			List<Row> list = sqlRunner.select(sql);
			
			return list;
		}
	
	
}
