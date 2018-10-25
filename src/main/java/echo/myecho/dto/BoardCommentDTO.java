package echo.myecho.dto;

import java.util.Date;

public class BoardCommentDTO {
	private int boardNo;
	private int boardComNo;
	private String boardComTxt;
	private String boardComWriter;
	private String boardComRegDate;
	private int boardComAvailable;

	public BoardCommentDTO() {
	};

	public BoardCommentDTO(int boardNo, int boardComNo, String boardComTxt, String boardComWriter, String boardComRegDate,
			int boardComAvailable) {
		super();
		this.boardNo = boardNo;
		this.boardComNo = boardComNo;
		this.boardComTxt = boardComTxt;
		this.boardComWriter = boardComWriter;
		this.boardComRegDate = boardComRegDate;
		this.boardComAvailable = boardComAvailable;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardComNo() {
		return boardComNo;
	}

	public void setBoardComNo(int boardComNo) {
		this.boardComNo = boardComNo;
	}

	public String getBoardComTxt() {
		return boardComTxt;
	}

	public void setBoardComTxt(String boardComTxt) {
		this.boardComTxt = boardComTxt;
	}

	public String getBoardComWriter() {
		return boardComWriter;
	}

	public void setBoardComWriter(String boardComWriter) {
		this.boardComWriter = boardComWriter;
	}

	public String getBoardComRegDate() {
		return boardComRegDate;
	}

	public void setBoardComRegDate(String boardComRegDate) {
		this.boardComRegDate = boardComRegDate;
	}

	public int getBoardComAvailable() {
		return boardComAvailable;
	}

	public void setBoardComAvailable(int boardComAvailable) {
		this.boardComAvailable = boardComAvailable;
	}

}
