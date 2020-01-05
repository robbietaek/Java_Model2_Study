package action.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class ListAction extends AdminLoginAction{

	@Override
	protected ActionForward adminExecute(HttpServletRequest request, HttpServletResponse response) {

		List<Member> list = new ArrayList<>(); 
		MemberDao dao = new MemberDao();
		list = dao.list();
		request.setAttribute("list", list);
		
		return new ActionForward();
	}

}
