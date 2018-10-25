package echo.myecho.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import echo.myecho.dto.MemberDTO;
import echo.myecho.interfaces.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	echo.myecho.interfaces.MemberDAO vo;

	@Override
	public String isMember(MemberDTO dto) {

		return vo.isMember(dto);
	}

	@Override
	public int signUp(MemberDTO dto) {

		return vo.signUp(dto);
	}

	@Override
	public MemberDTO getMemberInfo(String user_id) {
		return vo.getMemberInfo(user_id);
	}
}
