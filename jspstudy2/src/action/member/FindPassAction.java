package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class FindPassAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		MemberDao dao = new MemberDao();
		String pass = dao.findPass(id, email, tel);

		String msg = "��й�ȣ�� ã�� ���߽��ϴ�.";
		String url = "findpassForm.me";

		if (pass != null) { // password ã�����
			msg = "��й�ȣ�� ���������� ã�ҽ��ϴ�.";

			request.setAttribute("pass", pass);
			request.setAttribute("msg", msg);

			return new ActionForward(false, "findpass.jsp");

		} else {

			request.setAttribute("pass", pass);
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);

			return new ActionForward(false, "../alert.jsp");
		}
	}

}
