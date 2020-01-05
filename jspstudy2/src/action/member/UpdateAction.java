package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
/*
 * 1. 모든 파라미터 Member객체에저장
 * 2. 입력된 비밀번호와, db에 저장된 비밀번호가 같지 않으면 " 비밀번호가 틀렸습니다. 메세지 출력 후 update.me 페이지로 이동
 * 3. 1번에 내용을 db에 수정하기
 *  결과가 0보다 크면 수정성공 메세지 출력. info.me 페이지로이동
 *  0이하면 수정실패 메세지출력
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

		String msg = "비밀번호가 다릅니다.";
		String url = "updateForm.me?id="+id;
		MemberDao dao = new MemberDao();
		int update = dao.update(m);
		if (request.getParameter("pass").equals(dao.selectOne(id).getPass())){
			if (update > 0) {
				msg = "업데이트 성공";
				url = "info.me?id=" + id;
			} else {
				msg = "업데이트에 실패하였습니다.";
				url = "main.me";
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return new ActionForward(false, "../alert.jsp");

	}

}
