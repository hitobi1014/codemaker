package kr.co.codemaker.main;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/resources/egovframework/spring/context-common.xml",
								   "file:src/main/resources/egovframework/spring/context-datasource.xml",
								   "file:src/main/resources/egovframework/spring/context-transaction.xml",
									"file:src/main/resources/egovframework/spring/context-mapper.xml"})
public class ModelTestConfig {

//	@Resource(name="dataSource")
//	private DataSource dataSource;
	
	@Ignore
	@Test
	public void dummy() {
		
	}
	
	// db 테스트전 데이터를 초기화하는 스크립트 실행
	@Before
	public void setup() {
//		ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
//		populator.addScripts(new ClassPathResource("/kr/or/ddit/config/db/initData.sql"));
//		populator.setContinueOnError(false);
//		DatabasePopulatorUtils.execute(populator, dataSource);
	}
}
