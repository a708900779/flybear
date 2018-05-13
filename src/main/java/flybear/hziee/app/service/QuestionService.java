package flybear.hziee.app.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sun.tools.internal.ws.wsdl.framework.Entity;

import flybear.hziee.app.mapper.QuestionMapper;
import flybear.hziee.app.model.Question;
import flybear.hziee.app.util.UIUtils;
import flybear.hziee.core.mybatis.SqlRunner;
import flybear.hziee.core.sql.Row;
import flybear.hziee.core.sql.SQLBuilder;
import flybear.hziee.core.util.Fn;


@Service
public class QuestionService {

    @Autowired
    private QuestionMapper mapper;
    
    @Autowired
	private SqlRunner sqlRunner;

    public List<Question> findAll() {
        return mapper.selectAll();
    }

    public Integer delete(Integer id){
        return mapper.deleteByPrimaryKey(id);
    }
    
    public Question findById(Integer id){
		return mapper.selectByPrimaryKey(id);
	}
	
	public Integer update(Question entity) throws Exception{
		return mapper.updateByPrimaryKey(entity);
	}

    public Integer save(Question entity) {
        return mapper.insert(entity);
    }

    public Map<String, Object> getUIGridData(Map<String, Object> where, Map<String, String> pageMap) {
        SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Question.class);
        String sql = sqlBuilder
                .fields("*")   //这里约定前端grid需要显示多少个具体列，也可以全部*
                .where(where)
                .parseUIPageAndOrder(pageMap)
                .order("id", "asc")
                .selectSql();
        List<Row> list = sqlRunner.select(sql);

        for(Row row:list){
			row.put("releaseTime", Fn.date(row.getInt("releaseTime"), "yyyy-MM-dd"));
			row.put("answererId", getStaff(row.getInt("answererId")).getString("text"));
        }
        String countSql = sqlBuilder.fields("count(*)").where(where).selectSql();
        Integer count = sqlRunner.count(countSql);
        return UIUtils.getGridData(count, list);
    }
    
	public boolean questionIsExist(String key){
			SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Question.class);
			String sql = sqlBuilder.fields("*").where("key='"+key+"'").selectSql();
			List<Row> list = sqlRunner.select(sql);
			if(list.size()==0){
				return false;
			}else{
				return true;
			}
		}
	
	public  Row getStaff(int id) {
		String sql = "select id,staff_name as text from x_staff_info where id='"+id+"'";
		List<Row> list = sqlRunner.select(sql);
		Row name = list.get(0);
		return name;
	}

	public Map<String, Object> getUIGridDataSearch(String where,
			Map<String, String> pageMap) {
		 SQLBuilder sqlBuilder = SQLBuilder.getSQLBuilder(Question.class);
	        String sql = sqlBuilder
	                .fields("*")   //这里约定前端grid需要显示多少个具体列，也可以全部*
	                .where("question_title like '%"+where+"%' or question_content like '%"+where+"%'")
	                .parseUIPageAndOrder(pageMap)
	                .order("id", "asc")
	                .selectSql();
	        List<Row> list = sqlRunner.select(sql);

	        String countSql = sqlBuilder.fields("count(*)").where("question_title like '%"+where+"%' or question_content like '%"+where+"%'").selectSql();
	        Integer count = sqlRunner.count(countSql);
	        return UIUtils.getGridData(count, list);
	}
	
}
