package echo.myecho.dto;

import java.util.Date;

public class BoardDTO extends PageDTO{
	private int seq;
	private String title;
	private String contents;
	private String writer;
	private Date writeDate;
	private int groupNo; // ������ �׷� ��ȣ
	private int groupOrd;// �亯���� ����(seq)
	private int groupLayer;// �亯����
	private int available;// ������ �Խù� �����ƴٰ� ǥ�����ִ� �÷�

	public BoardDTO() {
	}

	public BoardDTO(int seq, String title, String contents, String writer, Date writeDate, int groupNo, int groupOrd,
			int groupLayer, int available) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.writeDate = writeDate;
		this.groupNo = groupNo;
		this.groupOrd = groupOrd;
		this.groupLayer = groupLayer;
		this.available = available;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getGroupOrd() {
		return groupOrd;
	}

	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}

	public int getGroupLayer() {
		return groupLayer;
	}

	public void setGroupLayer(int groupLayer) {
		this.groupLayer = groupLayer;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

}
