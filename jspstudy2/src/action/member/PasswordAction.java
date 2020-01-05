package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;

public class PasswordAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	    String login = (String)request.getSession().getAttribute("login");
		boolean  opener = false;
		boolean  closer = false;
		String msg = null;
		String url = null;
		if(login == null || login.trim().equals("")) {  //�α׾ƿ� ����
			opener = true;
		    closer = true;
			msg = "�α��� �ϼ���.";
			url = "loginForm.me";
		} else { //�α��� ����
		  String pass= request.getParameter("pass");
		  String chgpass= request.getParameter("chgpass");
		  MemberDao dao = new MemberDao();
		  Member mem = dao.selectOne(login);
		  if(pass.equals(mem.getPass())) {//�Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ���� ���
			  closer = true;
			  if(dao.updatePass(login,chgpass) > 0) {
				  opener = true;
				  msg="��й�ȣ�� ����Ǿ����ϴ�.";
				  url = "info.me?id="+login;
			  } else {
				  msg="��й�ȣ ����� ������ �߻� �߽��ϴ�.";
			  }
		  } else {  //�Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� �ٸ� ���
			  msg="��й�ȣ ���� �Դϴ�. Ȯ���ϼ���.";
			  url = "passwordForm.me";
		  }
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url",url);
		request.setAttribute("closer", closer);
		request.setAttribute("opener", opener);
		return new ActionForward();
	}

}
