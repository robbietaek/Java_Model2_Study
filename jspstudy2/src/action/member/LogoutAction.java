package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class LogoutAction extends UserLoginAction{

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {

		String msg = login + " 님이 로그아웃 되었습니다";
		String url = "loginForm.me";
		request.getSession().invalidate();
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false, "../alert.jsp");
	}



}
