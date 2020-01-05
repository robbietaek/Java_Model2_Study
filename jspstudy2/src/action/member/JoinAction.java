package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 * 1. 파라미터 정보를 Member 객체에 저장
 * 2. Member 객체를 db에 추가하기.
 * 		-성공 : 성공메세지출력, loginForm.me 로 이동
 * 		-실패 : 실패메세지 출력, joinForm.me 로 이동
 */
public class JoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String picture = request.getParameter("picture");
		
		Member mem = new Member();
		mem.setId(id);
		mem.setName(name);
		mem.setPass(pass);
		mem.setGender(gender);
		mem.setTel(tel);
		mem.setEmail(email);
		mem.setPicture(picture);
		
		MemberDao dao = new MemberDao();
		String msg = "회원가입 실패";
		String url = "joinForm.me";
		if(dao.insert(mem)>0) {
			msg = "회원가입 성공";
			url = "loginForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false, "../alert.jsp");
	}

}
