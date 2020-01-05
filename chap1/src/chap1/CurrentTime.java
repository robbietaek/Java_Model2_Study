package chap1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CurrentTime
 */
// url 정보가 /CurrentTime로 요청시 호출되는 서블릿임.
@WebServlet("/CurrentTime")		//어노테이션 	(CurrentTime 요청을 보낼 서블릿이 "나"야!)

public class CurrentTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurrentTime() {
        super();
        // TODO Auto-generated constructor stub
    }

    //Get 방식으로 요청시 호출되는 메서드
    //request : 요청 객체. 브라우저의 요청 정보 저장하고 있는 객체
    //response : 응답 객체 . 브라우저로 전달되는 응답정보를 저장하고 있는 객체
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=EUC-KR");
		Calendar c =Calendar.getInstance();
		int h = c.get(Calendar.HOUR_OF_DAY);
		int m = c.get(Calendar.MINUTE);
		int s = c.get(Calendar.SECOND);
		PrintWriter out = response.getWriter();	//문자형 출력스트림
		out.println("<html><head><title>현재시간</title><head");
		out.println("<body>");
		out.println("<h1>현재시간은" +h + "시" + m + "분" + s + "초입니다.</h1></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//post 방식으로 요청시 호출되는 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
