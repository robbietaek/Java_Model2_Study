package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 * 1. �Ķ���� ������ Member ��ü�� ����
 * 2. Member ��ü�� db�� �߰��ϱ�.
 * 		-���� : �����޼������, loginForm.me �� �̵�
 * 		-���� : ���и޼��� ���, joinForm.me �� �̵�
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
		String msg = "ȸ������ ����";
		String url = "joinForm.me";
		if(dao.insert(mem)>0) {
			msg = "ȸ������ ����";
			url = "loginForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false, "../alert.jsp");
	}

}
