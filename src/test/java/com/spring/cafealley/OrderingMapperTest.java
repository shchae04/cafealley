package com.spring.cafealley;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.command.OrderingVO;
import com.spring.cafealley.ordering.mapper.IOrderingMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class OrderingMapperTest {

	@Autowired
	IOrderingMapper mapper;

	@Test
	public void order() {
		for (int i = 1; i <= 30; i++) {
			OrderingVO vo = new OrderingVO("user" + i, 1000 * i, "주문자" + i, "010", "1234", "5678",
					"abc@naver.com", "받는사람" + i, "22207", "xx동 " + i + "길", "상세주소" + i, "010", "5678", "1234", "배송하지마",
					"무통장", "입금자" + i, "xx은행");
			mapper.order(vo);
		}

	}
}
