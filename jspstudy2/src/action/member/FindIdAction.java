package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class FindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = request.getParameter("id");
		
		
		if(id==null) {
			return idSearch(request,tel,email);
		}else {
			return findSearch(request,id,tel,email);
		}
	}

	private ActionForward findSearch(HttpServletRequest request, String id, String tel, String email) {
		MemberDao dao = new MemberDao();
		String pass = dao.findPass(id, email, tel);

		String msg = "비밀번호를 찾지 못했습니다.";
		String url = "findpassForm.me";

		if (pass != null) { // password 찾은경우
			msg = "비밀번호를 성공적으로 찾았습니다.";

			request.setAttribute("pass", pass.substring(2,pass.length()));
			request.setAttribute("msg", msg);

			return new ActionForward(false, "findpass.jsp");

		} else {

			request.setAttribute("pass", pass);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);

			return new ActionForward(false, "../alert.jsp");
		}
	}

	private ActionForward idSearch(HttpServletRequest request, String tel, String email) {
		MemberDao dao = new MemberDao();
		String id = dao.findId(email, tel);

		String msg = "아이디를 찾지 못했습니다.";
		String url = "findidForm.me";

		if (id != null) { // id 찾은경우
			msg = "아이디를 성공적으로 찾았습니다.";

			request.setAttribute("id", id);
			request.setAttribute("msg", msg);

			return new ActionForward(false, "findid.jsp");

		} else {

			request.setAttribute("id", id);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);

			return new ActionForward(false, "../alert.jsp");
		}
	}

}
