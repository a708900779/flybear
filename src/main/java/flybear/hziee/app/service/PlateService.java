package flybear.hziee.app.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import flybear.hziee.app.mapper.PlateMapper;
import flybear.hziee.app.model.Plate;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.mybatis.SqlRunner;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.sql.SQLBuilder;
import flybear.hziee.core.util.Fn;


@Service
public class PlateService {

    @Autowired
    private PlateMapper mapper;
    
    @Autowired
	private SqlRunner sqlRunner;

    public List<Plate> findAll() {
        return mapper.selectAll();
    }

    public Integer delete(Integer id){
        return mapper.deleteByPrimaryKey(id);
    }
    
    public Plate findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	public Integer update(Plate entity) throws Exception{
		int lastEditTime = (int) (System.currentTimeMillis()/1000); 
    	entity.setLastEditTime(lastEditTime);

		return mapper.updateByPrimaryKey(entity);
	}

    public Integer save(Plate entity) {
    	int lastEditTime = (int) (System.currentTimeMillis()/1000);
    	entity.setLastEditTime(lastEditTime);
    	entity.setProjectNum(0);
        return mapper.insert(entity);
    }

    public Map<String, Object> getUIGridData(Map<String, Object> where, Map<String, String> pageMap) {
        SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Plate.class);
        String sql = sqlBuilder
                .fields("*")   //这里约定前端grid需要显示多少个具体列，也可以全部*
                .where(where)
                .parseUIPageAndOrder(pageMap)
                .order("id", "asc")
                .selectSql();
        List<Row> list = sqlRunner.select(sql);
        for(Row row:list){
   			row.put("lastEditTime", Fn.date(row.getInt("lastEditTime"), "yyyy-MM-dd"));
   			row.put("plateManager", getStaffName(row.getInt("plateManager")).getString("text"));
   		}     
        String countSql = sqlBuilder.fields("count(*)").where(where).selectSql();
        Integer count = sqlRunner.count(countSql);
        return UIUtils.getGridData(count, list);
    }
    
	private Row getStaffName(Integer value) {
		String sql = "select staff_name as text from x_staff_info where id = "+value+"";
		List<Row> list = sqlRunner.select(sql);
		Row name = list.get(0);
		return name;
	}

	public boolean plateIsExist(String key){
			SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Plate.class);
			String sql = sqlBuilder.fields("*").where("key='"+key+"'").selectSql();
			List<Row> list = sqlRunner.select(sql);
			if(list.size()==0){
				return false;
			}else{
				return true;
			}
		}
	public List<Row> getList() {
		/*SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Role.class);
		String sql = sqlBuilder.fields("id,name as text") // 这里约定前端grid需要显示多少个具体列，也可以全部*
				.where(where)
				.order("id", "asc").selectSql();*/
		String sql = "select id,plate_name as text from x_plate";
		List<Row> list = sqlRunner.select(sql);
		return list;
	}

}
