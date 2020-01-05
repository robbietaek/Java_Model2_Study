package action.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();

	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "Hello, World");
		return new ActionForward();
	}

	/*
	 * 1.mutipart/form-data 타입의 전송이므로 MultipartRequest 객체 생성 2.파라미터 값을 model.Board
	 * 객체 저장. 3.게시물 번호 num 현재 등록된 num의 최대값을 조회. 최대값 +1 등록된 게시물 번호. db에서 maxnum을 구해서
	 * +1 값으로 num을 설정하기 4.board 내용을 db에 등록하기. 등록성공 : 메세지 출력 . list.do 페이지로 이동 등록실패 :
	 * 메세지 출력 . writeForm.me 페이지로 이동
	 */

	public ActionForward write(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String msg = "게시물 등록 실패";
		String url = "writeForm.do";
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board b = new Board();
			b.setName(multi.getParameter("name"));
			b.setPass(multi.getParameter("pass"));
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setFile1(multi.getFilesystemName("file1"));

			int num = dao.maxnum();
			b.setNum(++num);
			b.setGrp(num);

			if (dao.insert(b)) {
				msg = "게시물 등록 성공";
				url = "list.do";
			}
		} catch (IOException e) {
			throw new ServletException(e);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	/*
	 * 1. 한페이지당 10건의 게시물을 출력하기. pageNum 파라미터값을 저장 => 없는 경우는 1로 설정하기. 2. 최근 등록된 게시물이
	 * 가장 위에 배치함. 3. 화면에 필요한 정보를 속성으로 등록
	 */
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int limit = 10;
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {

		}
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column != null && column.trim().equals("")) {
			column = null;
		}
		if(find != null && find.trim().equals("")) {
			find = null;
		}
		if(column == null || find == null) {
			column = null;
			find = null;
		}
		int boardcnt = dao.boardCount(column,find); // 총 게시물의 건수
		List<Board> list = dao.list(pageNum, limit, column, find); // 게시물 목록 하나하나들이 저장되게 할 것이다.
		int maxpage = (int) ((double) boardcnt / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.95) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		int boardnum = boardcnt - (pageNum - 1) * limit;
		request.setAttribute("boardcnt", boardcnt);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}

	public ActionForward info(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num);

		if (request.getRequestURI().contains("/board/info.do")) { // request.getRequestURI() : /jspstudy2/model2/info.do
																	// 를 실행할때만 증가
			dao.readcntadd(num);
		}

		request.setAttribute("b", b);
		return new ActionForward();
	}

	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		Board b = new Board();
		b.setNum(Integer.parseInt(request.getParameter("num")));
		b.setGrp(Integer.parseInt(request.getParameter("grp")));
		b.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));
		b.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
		b.setName(request.getParameter("name"));
		b.setPass(request.getParameter("pass"));
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));

		dao.grpStepAdd(b.getGrp(), b.getGrpstep());

		int grplevel = b.getGrplevel();
		int grpstep = b.getGrpstep();
		int num = dao.maxnum();

		String msg = "답변등록시 오류발생";
		String url = "replyForm.do?num=" + b.getNum();

		b.setNum(++num);
		b.setGrplevel(grplevel + 1);
		b.setGrpstep(grpstep + 1);

		if (dao.insert(b)) {
			msg = "답변등록완료";
			url = "list.do";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";

		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		Board b = new Board();
		String pass = dao.selectOne(Integer.parseInt(multi.getParameter("num"))).getPass();
		b.setNum(Integer.parseInt(multi.getParameter("num")));
		b.setName(multi.getParameter("name"));
		b.setPass(multi.getParameter("pass"));
		b.setSubject(multi.getParameter("subject"));
		b.setContent(multi.getParameter("content"));
		b.setFile1(multi.getFilesystemName("file1"));
		if (b.getFile1() == null || b.getFile1().equals("")) {
			b.setFile1(multi.getParameter("file2"));
		}

		Board dbBoard = dao.selectOne(b.getNum());
		String msg = "비밀번호가 틀렸습니다.";
		String url = "updateForm.do?num" + b.getNum();

		if (b.getPass().equals(dbBoard.getPass())) {
			if (dao.update(b)) {
				msg = "업데이트 되었습니다.";
				url = "info.do?num=" + b.getNum();
			} else {
				msg = "게시물 수정 실패";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");

		String dbpass = dao.selectOne(num).getPass();
		String msg = "비밀번호가 다릅니다.";
		String url = "list.do?num="+num;
				
		if(pass.equals(dbpass)) {
			msg = "삭제되었습니다.";
			url = "list.do";
			dao.delete(num);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false, "../alert.jsp");
		
	}
	
	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/")+"model2/board/imgfile/";
		File f = new File(path);
		if(!f.exists()){
			f.mkdir();
		}
		MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
		String fileName = multi.getFilesystemName("upload");	//파일이름을 가져옴 upload로 정해져있음
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
	}
}
