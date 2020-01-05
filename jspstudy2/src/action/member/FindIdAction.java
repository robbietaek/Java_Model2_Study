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

		String msg = "��й�ȣ�� ã�� ���߽��ϴ�.";
		String url = "findpassForm.me";

		if (pass != null) { // password ã�����
			msg = "��й�ȣ�� ���������� ã�ҽ��ϴ�.";

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

		String msg = "���̵� ã�� ���߽��ϴ�.";
		String url = "findidForm.me";

		if (id != null) { // id ã�����
			msg = "���̵� ���������� ã�ҽ��ϴ�.";

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
