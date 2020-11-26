package kr.co.codemaker;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:egovframework/spring/context-mapper.xml",
		"classpath:egovframework/spring/context-datasource.xml",
		"file:src/main/webapp/WEB-INF/config/egovframework/springmvc/dispatcher-servlet.xml"
})
public class ModelTestConfig {
	
//	@Resource(name="dataSource")
//	private DataSource dataSource;
	
	@Ignore
	@Test
	public void dummy() {
		
	}
	
//	@Before
//	public void setup() {
//		ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
//		populator.addScripts(new ClassPathResource("/kr/or/ddit/config/db/initData.sql")); 
//		populator.setContinueOnError(false);  // 스크립트 실행 중 에러 발생 시 멈춤
//		DatabasePopulatorUtils.execute(populator, dataSource);
//	}
}

