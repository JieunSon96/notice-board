package echo.myecho.dto;

import java.util.Date;

public class FilesDTO {
	private int board_seq;
	private String original_name;
	private String system_name;
	private int file_size;
	private Date crea_date;
	private String del_check;

	public FilesDTO() {

	}

	public FilesDTO(int board_seq, String original_name, String system_name, int file_size, Date crea_date,
			String del_check) {
		super();
		this.board_seq = board_seq;
		this.original_name = original_name;
		this.system_name = system_name;
		this.file_size = file_size;
		this.crea_date = crea_date;
		this.del_check = del_check;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getOriginal_name() {
		return original_name;
	}

	public void setOriginal_name(String original_name) {
		this.original_name = original_name;
	}

	public String getSystem_name() {
		return system_name;
	}

	public void setSystem_name(String system_name) {
		this.system_name = system_name;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public Date getCrea_date() {
		return crea_date;
	}

	public void setCrea_date(Date crea_date) {
		this.crea_date = crea_date;
	}

	public String getDel_check() {
		return del_check;
	}

	public void setDel_check(String del_check) {
		this.del_check = del_check;
	}

}
