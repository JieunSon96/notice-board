package echo.myecho.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import echo.myecho.dto.BoardCommentDTO;
import echo.myecho.dto.BoardDTO;
import echo.myecho.dto.FilesDTO;
import echo.myecho.interfaces.BoardService;
import echo.myecho.interfaces.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO vo;

	@Override
	public int writeConfirm(BoardDTO dto) {
		return vo.writeConfirm(dto);
	}

	@Override
	public BoardDTO read(int seq) {
		return vo.read(seq);
	}

	@Override
	public int updateGroupNo(int seq) {
		return vo.updateGroupNo(seq);
	}

	@Override
	public int updateConfirm(BoardDTO dto) {
		return vo.updateConfirm(dto);
	}

	@Override
	public int removeConfirm(int seq) {
		return vo.removeConfirm(seq);
	}

	@Override
	public int getContentCnt(BoardDTO dto) {
		return vo.getContentCnt(dto);
	}

	@Override
	public List<BoardDTO> getContentList(BoardDTO dto) {
		return vo.getContentList(dto);
	}

	@Override
	public int replyConfirm(BoardDTO dto) {
		return vo.replyConfirm(dto);

	}

	@Override
	public int replyUpdate(int groupNo, int groupOrd) {
		return vo.replyUpdate(groupNo, groupOrd);
	}

	@Override
	public int fileInput(FilesDTO fdto) {
		return vo.fileInput(fdto);
	}

	@Override
	public FilesDTO getFileInfo(int seq) {
		return vo.getFileInfo(seq);
	}

	@Override
	public int writeComment(BoardCommentDTO dto) {
		return vo.writeComment(dto);
	}

	@Override
	public BoardCommentDTO getOneComment(int boardComNo) {
		return vo.getOneComment(boardComNo);
	}

	@Override
	public List<BoardCommentDTO> getListComment(int boardNo) {
		return vo.getListComment(boardNo);
	}

	@Override
	public int removeComment(int boardComNo) {
		return vo.removeComment(boardComNo);
	}

}
