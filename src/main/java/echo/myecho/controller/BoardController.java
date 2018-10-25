package echo.myecho.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.activation.CommandMap;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import echo.myecho.dto.BoardCommentDTO;
import echo.myecho.dto.BoardDTO;
import echo.myecho.dto.FilesDTO;
import echo.myecho.dto.MemberDTO;
import echo.myecho.files.DownLoadImple;
import echo.myecho.files.FileUploadService;
import echo.myecho.interfaces.BoardService;
import echo.myecho.interfaces.MemberService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private MemberService m_service;

	@Autowired
	ServletContext context;

	@Autowired
	FileUploadService fileUploadService;

	@RequestMapping("goBoardList.bo")
	public String boardList(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session,
			HttpServletRequest request, @ModelAttribute("BoardDTO") BoardDTO dto) {
		System.out.println("옵션 :" + dto.getSearchCondition() + "/ 벨류 : " + dto.getSearchValue());
		// 페이징 처리
		int totalCount = service.getContentCnt(dto);// 게시물 총 개수 구하기
		dto.setTotalCount(totalCount); // 페이징 처리를 위한 setter 호출
		model.addAttribute("PageDTO", dto);
		List<BoardDTO> boardList = this.service.getContentList(dto);

		MemberDTO name = this.m_service.getMemberInfo((String) session.getAttribute("user_id"));

		model.addAttribute("username", name.getUser_name());
		model.addAttribute("boardList", boardList);

		return "board/boardList";

	}

	@RequestMapping("articleView.bo")
	public ModelAndView goArticleView(int seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		BoardDTO read = this.service.read(seq);
		FilesDTO getFileInfo = this.service.getFileInfo(seq);
		MemberDTO getInfo = m_service.getMemberInfo(read.getWriter());
		mav.addObject("boardNo", seq);
		mav.addObject("username", getInfo.getUser_name());
		mav.addObject("user_id", (String) session.getAttribute("user_id"));
		mav.addObject("read", read);
		if (!(getFileInfo == null)) {
			mav.addObject("fileName", getFileInfo.getOriginal_name());
			mav.addObject("fileSystemName", getFileInfo.getSystem_name());
		}
		
		List<BoardCommentDTO> commentList=this.service.getListComment(seq);
		mav.addObject("commentList", commentList);
		mav.setViewName("board/articleView");
		return mav;

	}

	@RequestMapping("write.bo")
	public ModelAndView write(MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("write.bo");
		mav.setViewName("board/boardWrite");
		return mav;
	}

	@RequestMapping("writeConfirm.bo")
	public ModelAndView writeConfirm(BoardDTO dto, HttpSession session, HttpServletRequest request,
			@RequestParam("files") MultipartFile file) throws Exception {
		System.out.println("writeConfirm.bo");

		ModelAndView mav = new ModelAndView();
		dto.setWriter((String) session.getAttribute("user_id"));
		String url = fileUploadService.restore(file);
		System.out.println("url : " + url);

		this.service.writeConfirm(dto);
		this.service.updateGroupNo(dto.getSeq());
		System.out.println("board_seq : " + dto.getSeq());
		FilesDTO fdto = new FilesDTO();
		fdto.setBoard_seq(dto.getSeq());
		String original_name = url.substring(8).split("#")[0];
		String system_name = url.substring(8).split("#")[1];
		fdto.setOriginal_name(original_name);
		fdto.setSystem_name(system_name);
		int fileInsert = this.service.fileInput(fdto);
		System.out.println("fileInsert succsss" + " / " + fileInsert + " name :" + fdto.getOriginal_name());
		BoardDTO read = this.service.read(dto.getSeq());
		MemberDTO getInfo = m_service.getMemberInfo(dto.getWriter());
		
		List<BoardCommentDTO> commentList=this.service.getListComment(dto.getSeq());
		
		mav.addObject("boardNo", dto.getSeq());
		mav.addObject("username", getInfo.getUser_name());
		mav.addObject("read", read);
		mav.addObject("fileSystemName", fdto.getSystem_name());
		mav.addObject("fileName", fdto.getOriginal_name());
		mav.addObject("commentList", commentList);
		System.out.println(fdto.getOriginal_name());
		mav.setViewName("board/articleView");
		return mav;

	}

	@RequestMapping("fileDownload.bo")
	public void download(@RequestParam("fName") String fName, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("fileDownload");
		ModelAndView mav = new ModelAndView();
		String realFolder = "C:\\files\\";
		DownLoadImple d = new DownLoadImple();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", new File(realFolder + fName));
		d.render(map, request, response);

	}

	@RequestMapping("reply.bo")
	public ModelAndView reply(int seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("reply.bo");
		System.out.println("seq : " + seq);
		mav.addObject("seq", seq);
		mav.setViewName("board/boardReplyWrite");
		return mav;
	}

	@RequestMapping("replyConfirm.bo")
	public ModelAndView replyConfirm(BoardDTO dto, int parentSeq, HttpSession session) {
		System.out.println("replyConfirm.bo");
		ModelAndView mav = new ModelAndView();
		BoardDTO parent = this.service.read(parentSeq);
		dto.setWriter((String) session.getAttribute("user_id"));
		dto.setGroupNo(parent.getGroupNo());
		dto.setGroupOrd(parent.getGroupOrd() + 1);
		dto.setGroupLayer(parent.getGroupLayer() + 1);
		this.service.replyConfirm(dto);
		this.service.replyUpdate(parent.getGroupNo(), parent.getGroupOrd());
		System.out.println("자식 board_seq : " + dto.getSeq());
		BoardDTO read = this.service.read(dto.getSeq());
		MemberDTO getInfo = m_service.getMemberInfo(dto.getWriter());
		
		List<BoardCommentDTO> commentList=this.service.getListComment(dto.getSeq());
		
		mav.addObject("boardNo", dto.getSeq());
		mav.addObject("username", getInfo.getUser_name());
		mav.addObject("read", read);
		mav.addObject("commentList", commentList);
		mav.setViewName("board/articleView");
		return mav;

	}

	@RequestMapping("update.bo")
	public ModelAndView updateRequest(int seq) {
		ModelAndView mav = new ModelAndView();
		System.out.println("update.bo");
		BoardDTO info = this.service.read(seq);

		mav.addObject("info", info);
		mav.addObject("seq", seq);
		mav.setViewName("board/boardUpdate");
		return mav;
	}

	@RequestMapping("updateConfirm.bo")
	public ModelAndView updateConfirm(BoardDTO dto, HttpSession session) {
		System.out.println("updateConfirm.bo");
		ModelAndView mav = new ModelAndView();
		this.service.updateConfirm(dto);
		System.out.println("edit seq= " + dto.getSeq());
		BoardDTO read = this.service.read(dto.getSeq());
		MemberDTO getInfo = m_service.getMemberInfo((String) session.getAttribute("user_id"));
		List<BoardCommentDTO> commentList=this.service.getListComment(dto.getSeq());
		
		mav.addObject("boardNo", dto.getSeq());
		mav.addObject("username", getInfo.getUser_name());
		mav.addObject("read", read);
		mav.addObject("user_id", session.getAttribute("user_id"));
		mav.addObject("commentList", commentList);
		
		
		mav.setViewName("board/articleView");
		return mav;
	}

	@RequestMapping("removeConfirm.bo")
	public ModelAndView removeConfirm(HttpSession session, int seq) {
		System.out.println("removeConfirm.bo");
		ModelAndView mav = new ModelAndView();
		int remove = this.service.removeConfirm(seq);
		if (remove > 0) {
			System.out.println("Delete Success!");
		}

		mav.setViewName("board/boardList");
		return mav;
	}
	
	@RequestMapping("writeComment.bo")
	public void writeComment(HttpSession session,HttpServletResponse response,BoardCommentDTO cdto) throws Exception{
		System.out.println("writeComment.bo");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String today = sdf.format(new Date());
		cdto.setBoardComRegDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime()).toString());
		cdto.setBoardComWriter(session.getAttribute("user_id").toString());
		this.service.writeComment(cdto);
		BoardCommentDTO comment=this.service.getOneComment(cdto.getBoardComNo());

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

			new Gson().toJson(comment, response.getWriter());
		
	}
	
	@RequestMapping("boardCommentRemove.bo")
	public ModelAndView removeComment(HttpSession session,int boardComNo,int boardNo) {
		System.out.println("boardCommentRemove.bo");
		this.service.removeComment(boardComNo);
		ModelAndView mav = new ModelAndView();
		BoardDTO read = this.service.read(boardNo);
		FilesDTO getFileInfo = this.service.getFileInfo(boardNo);
		MemberDTO getInfo = m_service.getMemberInfo(read.getWriter());
		mav.addObject("boardNo", boardNo);
		mav.addObject("username", getInfo.getUser_name());
		mav.addObject("user_id", (String) session.getAttribute("user_id"));
		mav.addObject("read", read);
		if (!(getFileInfo == null)) {
			mav.addObject("fileName", getFileInfo.getOriginal_name());
			mav.addObject("fileSystemName", getFileInfo.getSystem_name());
		}
		
		List<BoardCommentDTO> commentList=this.service.getListComment(boardNo);
		mav.addObject("commentList", commentList);
		mav.setViewName("board/articleView");
		return mav;
		
		
	}
}
