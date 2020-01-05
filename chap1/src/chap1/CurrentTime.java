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
// url ������ /CurrentTime�� ��û�� ȣ��Ǵ� ������.
@WebServlet("/CurrentTime")		//������̼� 	(CurrentTime ��û�� ���� ������ "��"��!)

public class CurrentTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurrentTime() {
        super();
        // TODO Auto-generated constructor stub
    }

    //Get ������� ��û�� ȣ��Ǵ� �޼���
    //request : ��û ��ü. �������� ��û ���� �����ϰ� �ִ� ��ü
    //response : ���� ��ü . �������� ���޵Ǵ� ���������� �����ϰ� �ִ� ��ü
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
		PrintWriter out = response.getWriter();	//������ ��½�Ʈ��
		out.println("<html><head><title>����ð�</title><head");
		out.println("<body>");
		out.println("<h1>����ð���" +h + "��" + m + "��" + s + "���Դϴ�.</h1></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//post ������� ��û�� ȣ��Ǵ� �޼���
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
