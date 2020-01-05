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
		if(login == null || login.trim().equals("")) {  //로그아웃 상태
			opener = true;
		    closer = true;
			msg = "로그인 하세요.";
			url = "loginForm.me";
		} else { //로그인 상태
		  String pass= request.getParameter("pass");
		  String chgpass= request.getParameter("chgpass");
		  MemberDao dao = new MemberDao();
		  Member mem = dao.selectOne(login);
		  if(pass.equals(mem.getPass())) {//입력된 비밀번호와 db에 저장된 비밀번호가 같은 경우
			  closer = true;
			  if(dao.updatePass(login,chgpass) > 0) {
				  opener = true;
				  msg="비밀번호가 변경되었습니다.";
				  url = "info.me?id="+login;
			  } else {
				  msg="비밀번호 변경시 오류가 발생 했습니다.";
			  }
		  } else {  //입력된 비밀번호와 db에 저장된 비밀번호가 다른 경우
			  msg="비밀번호 오류 입니다. 확인하세요.";
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
