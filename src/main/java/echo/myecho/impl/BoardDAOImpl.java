package echo.myecho.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import echo.myecho.dto.BoardCommentDTO;
import echo.myecho.dto.BoardDTO;
import echo.myecho.dto.FilesDTO;
import echo.myecho.interfaces.BoardDAO;

@Component
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlTemplate;

	@Override
	public int writeConfirm(BoardDTO dto) {
		return sqlTemplate.insert("Board.write", dto);
	}

	@Override
	public BoardDTO read(int seq) {
		return sqlTemplate.selectOne("Board.read", seq);
	}

	@Override
	public int updateGroupNo(int seq) {

		return sqlTemplate.update("Board.updateGroupNo", seq);
	}

	@Override
	public int updateConfirm(BoardDTO dto) {
		return sqlTemplate.update("Board.updateConfirm", dto);
	}

	@Override
	public int removeConfirm(int seq) {
		return sqlTemplate.delete("Board.removeConfirm", seq);
	}


	@Override
	public int getContentCnt(BoardDTO dto) {
		return sqlTemplate.selectOne("Board.selectContentCnt", dto);
	}

	@Override
	public List<BoardDTO> getContentList(BoardDTO dto) {
		return sqlTemplate.selectList("Board.selectContent",dto);
	}

	@Override
	public int replyConfirm(BoardDTO dto) {
		return sqlTemplate.insert("Board.replyInsert",dto);
	}

	@Override
	public int replyUpdate(int groupNo, int groupOrd) {
		Map<String,Object>parameters=new HashMap<String,Object>();
		parameters.put("groupNo", groupNo);
		parameters.put("groupOrd", groupOrd);
		return sqlTemplate.update("Board.replyUpdate",parameters);
		
	}

	@Override
	public int fileInput(FilesDTO fdto) {
		return sqlTemplate.insert("Board.fileInsert",fdto);
	}

	@Override
	public FilesDTO getFileInfo(int seq) {
		return sqlTemplate.selectOne("Board.getFileInfo",seq);
	}

	@Override
	public int writeComment(BoardCommentDTO dto) {
		return sqlTemplate.insert("Board.writeComment",dto);
	}

	@Override
	public BoardCommentDTO getOneComment(int boardComNo) {
		return sqlTemplate.selectOne("Board.getOneComment", boardComNo);
	}

	@Override
	public List<BoardCommentDTO> getListComment(int boardNo) {
		return sqlTemplate.selectList("Board.getListComment", boardNo);
	}

	@Override
	public int removeComment(int boardComNo) {
		return sqlTemplate.delete("Board.removeComment",boardComNo);
	}

}
