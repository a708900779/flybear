//package springboot;
//
//
//import java.util.List;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import flybear.hziee.Application;
//import flybear.hziee.app.mapper.NewsMapper;
//import flybear.hziee.app.model.News;
//import flybear.hziee.app.model.User;
//import flybear.hziee.core.mybatis.SqlRunner;
//import flybear.hziee.core.sql.Row;
//import flybear.hziee.core.sql.SQLBuilder;
//
//@RunWith(SpringJUnit4ClassRunner.class)  
//@SpringBootTest(classes=Application.class)// 指定spring-boot的启动类
//public class ServiceTest {
//	
//	@Autowired
//    private NewsMapper mapper;
//    
//    @Autowired
//	private SqlRunner sqlRunner;
//    
//	@Test 
//	public void findAll() {
//		List<News> newsList = mapper.selectAll();
//		for(News news: newsList){
//			System.out.println(news.getTitle());
//		}
//    }
//	
//	
//	@Test 
//    public void test() {
//		SQLBuilder sb = SQLBuilder.getSQLBuilder(News.class);
//		String sql = sb.fields("*").selectSql();
//		List<Row> NewsList = sqlRunner.select(sql);
//		for(Row row: NewsList){
//			System.out.println("#"+row.get("title"));
//		}
//    }
//}
