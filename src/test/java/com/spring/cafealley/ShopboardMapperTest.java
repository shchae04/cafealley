package com.spring.cafealley;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.cafealley.command.ShopboardVO;
import com.spring.cafealley.shopboard.mapper.IShopboardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class ShopboardMapperTest {

	@Autowired
	private IShopboardMapper mapper;

	@Test
	public void regist() {
		for (int procount = 1; procount <= 4; procount++) {
			for (int i = 1; i <= 5; i++) {
				ShopboardVO vo = new ShopboardVO();
				vo.setTitle("Testing Title" + i);
				vo.setUserid("Testing Userid" + i);
				vo.setContent("Testing Content" + i);
				vo.setProno(i);
				vo.setProcount(i);
				if(procount >=2) { 
					vo.setProno2(i+100);
					if(procount>=3) {
						vo.setProno3(i+200);
						if(procount==4) {
							vo.setProno4(i+300);
						}
					}
				}
				mapper.regist(vo);
				
			}
			
		}	
		
	}

	@Test
	public void getList() {
		List<ShopboardVO> list = mapper.getList();
		for(ShopboardVO vo : list) {
			System.out.println(vo);
			System.out.println("---------------------");
		}
	}

	@Test
	public void getContent() {
		ShopboardVO vo = mapper.getContent(19);
		System.out.println(vo);
	}

	@Test
	public void modify() {
		ShopboardVO vo = new ShopboardVO();
		vo.setBno(19);
		vo.setTitle("Modifying Title");
		vo.setContent("Modifying content");
		mapper.modify(vo);
	}

	@Test
	public void delete() {
		mapper.delete(19);
	}

}
