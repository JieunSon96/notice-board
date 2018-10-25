package echo.myecho.interfaces;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import echo.myecho.dto.BoardCommentDTO;
import echo.myecho.dto.BoardDTO;
import echo.myecho.dto.FilesDTO;

public interface BoardService {

	int getContentCnt(BoardDTO dto);

	List<BoardDTO> getContentList(BoardDTO dto);

	public int writeConfirm(BoardDTO dto);

	public int fileInput(FilesDTO fdto);

	public int replyConfirm(BoardDTO dto);

	public int replyUpdate(int groupNo, int groupOrd);

	public BoardDTO read(int seq);

	public FilesDTO getFileInfo(int seq);

	public int updateGroupNo(int seq);

	public int updateConfirm(BoardDTO dto);

	public int removeConfirm(int seq);

	public int writeComment(BoardCommentDTO dto);
	
	public BoardCommentDTO getOneComment(int boardComNo);
	
	public List<BoardCommentDTO> getListComment(int boardNo);
	
	public int removeComment(int boardComNo);

}
