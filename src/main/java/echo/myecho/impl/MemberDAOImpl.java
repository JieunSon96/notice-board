package echo.myecho.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import echo.myecho.dto.MemberDTO;

@Component
public class MemberDAOImpl implements echo.myecho.interfaces.MemberDAO{

	@Autowired
	private SqlSession sqlTemplate;
	


	@Override
	public String isMember(MemberDTO dto) {
		return sqlTemplate.selectOne("Member.isMember",dto);
	}

	@Override
	public int signUp(MemberDTO dto) {
		return sqlTemplate.insert("Member.signUp",dto);
	}

	@Override
	public MemberDTO getMemberInfo(String user_id) {
		return sqlTemplate.selectOne("Member.getInfo", user_id);
	}
}
