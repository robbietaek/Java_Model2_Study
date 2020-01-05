<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/thumbnail/thumbnail.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����̹����� ����� �̹��� ����</title>
</head>
<body>
<%
//path : �̹��� ���ε� ��ġ.
//  .metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspstudy1/thumbnail/
   String path = application.getRealPath("/") + "thumbnail/";
   int size = 10 * 1024 * 1024; //�ִ� ���ε� ũ��
   /*
   request : ��û ��ü. �Ķ��������, ��������, ���� ����=> ������ ����
   path : ���� ���ε� ���� ����
   size : �ִ� ���ε�� �� �ִ� ������  ũ��.
   "EUC-KR" : ���ڵ� ����
   => ���� ���ε� �Ϸ�
   */
   MultipartRequest multi = new MultipartRequest
		   (request,path,size,"EUC-KR");
   //fname : ���ε�� ������ �̸�
   String fname = multi.getFilesystemName("picture");
   //new File(path + fname) : ���ε�� �̹����� ��ġ.
   //BufferedImage : �̹����� �о �޸𸮿� �ε�.
   // bi : �����̹����� �޸� �ε� ������ ����
   BufferedImage bi = ImageIO.read(new File(path + fname));
   int width = bi.getWidth()/5; //�����̹����� ���� ũ���� 1/5 
   int height = bi.getHeight()/5;//�����̹����� ���� ũ���� 1/5 
   //thumb : ������ 1/5ũ���� �̹��� ���۸� ����. ������ �÷��� ����
   BufferedImage thumb = new BufferedImage
		   (width,height,BufferedImage.TYPE_INT_RGB);
   //g : �׸��� ���� ��ü
   Graphics2D g = thumb.createGraphics();
   //drawImage : �̹��� �׸���. �̹������ۿ� ������ 1/5ũ���� �̹��� ����
   g.drawImage(bi,0,0,width,height,null);
   File f = new File(path + "sm_" +fname);
   //�̹��������� ������ ���Ϸ� ����
   ImageIO.write(thumb,"jpg",f);
%>
<h3>�����̹���</h3>
<img src="<%=fname %>"><p>
<h3>������̹���</h3>
<img src="sm_<%=fname %>"><p>
</body>
</html>