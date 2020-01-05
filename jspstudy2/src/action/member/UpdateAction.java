package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
/*
 * 1. ��� �Ķ���� Member��ü������
 * 2. �Էµ� ��й�ȣ��, db�� ����� ��й�ȣ�� ���� ������ " ��й�ȣ�� Ʋ�Ƚ��ϴ�. �޼��� ��� �� update.me �������� �̵�
 * 3. 1���� ������ db�� �����ϱ�
 *  ����� 0���� ũ�� �������� �޼��� ���. info.me ���������̵�
 *  0���ϸ� �������� �޼������
 */
import model.MemberDao;

public class UpdateAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {

		Member m = new Member();
		m.setId(id);
		m.setName(request.getParameter("name"));
		m.setPass(request.getParameter("pass"));
		m.setGender(Integer.parseInt(request.getParameter("gender")));
		m.setTel(request.getParameter("tel"));
		m.setEmail(request.getParameter("email"));
		m.setPicture(request.getParameter("picture"));

		String msg = "��й�ȣ�� �ٸ��ϴ�.";
		String url = "updateForm.me?id="+id;
		MemberDao dao = new MemberDao();
		int update = dao.update(m);
		if (request.getParameter("pass").equals(dao.selectOne(id).getPass())){
			if (update > 0) {
				msg = "������Ʈ ����";
				url = "info.me?id=" + id;
			} else {
				msg = "������Ʈ�� �����Ͽ����ϴ�.";
				url = "main.me";
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return new ActionForward(false, "../alert.jsp");

	}

}
