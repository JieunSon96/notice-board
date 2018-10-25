package echo.myecho.interfaces;

import echo.myecho.dto.MemberDTO;

public interface MemberService {
	
	public String isMember(MemberDTO dto);

	public int signUp(MemberDTO dto);
	
	public MemberDTO getMemberInfo(String user_id);
}
