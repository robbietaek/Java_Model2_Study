<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--��ũ��Ʈ(Script) ���� : �ڹٿ��� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Script ����</title>
</head>
<body>
<%	//��ũ��Ʈ��(scriptlet)
	String msg= "��ũ��Ʈ ����";		//��������
	for(int i = 1; i<= 10; i++){
%>
<%=i+":"+this.msg+ " ---�̰��� ������� ȣ���Դϴ�.\t\t" + msg + " ---�̰��� ��������Դϴ�." %><br>		<%--ǥ����(�����ݷ��� �� �� ����) out.print(����); ���� ����. /* */ �ּ��� ��밡��  --%>
<%}%> 

<%!//����
String msg = "�������� ������ msg ����";	//�������
String getMsg(){
	return msg;
}

%>


</body>
</html>