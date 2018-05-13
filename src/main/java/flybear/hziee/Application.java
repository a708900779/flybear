package flybear.hziee;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan
@ServletComponentScan
@MapperScan(basePackages = {"flybear.hziee.app.mapper","flybear.hziee.core.mybatis"})
/**
 * 内置tomcat执行写法
 * 
 * @author zhoumx
 *
 */
public class Application{

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}

//@SpringBootApplication
//@ComponentScan
//@MapperScan(basePackages = {"flybear.hziee.app.mapper","flybear.hziee.core.mybatis"})
///**
// * 外置tomcat写法
// * @author zhoumx
// *
// */
//public class Application extends SpringBootServletInitializer {
//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
//        // TODO Auto-generated method stub
//        return builder.sources(Application.class);
//    }
//
//    public static void main(String[] args) {
//        SpringApplication.run(Application.class, args);
//    }
//}