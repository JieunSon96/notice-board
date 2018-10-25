package echo.myecho.dto;

import java.util.Date;

public class MemberDTO {

	String user_id;
	String user_name;
	String password;
	Date reg_dt;

	public MemberDTO() {
	}

	public MemberDTO(String user_id, String user_name, String password, Date reg_dt) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = password;
		this.reg_dt = reg_dt;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}



}
