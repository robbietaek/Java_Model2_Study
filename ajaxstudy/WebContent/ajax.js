var ajax = null;
function getAjaxObject(){
	if(window.ActiveXObject){	//브라우저가 익스플로러?
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");	//상위버전
		} catch(e){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");	//이하버전
			}catch(e2){
				return null;
			}
		}
	}else if(window.XMLHttpRequest){	//익스플로러 이외의 브라우저?
		return new XMLHttpRequest();
	}else{
		return null;
	}
}//getAjaxObject() 함수 끝
//url : "hello.jsp"
//params : "name="+김삿갓
//callback : helloFromServer
//method : "POST"
//ajax 생성기능 표준 객체 이름 : XMLHttpRequest 객체임.
function sendRequest(url,params,callback,method){
	//ajax : XMLHTTPRequest 객체를 저장 . ajax을 실행할 수 있는 객체, 서버와 통신할 수 있는 객체
	ajax = getAjaxObject();	
	var httpMethod = method?method:"GET";	//get||post 둘중 한개의 값
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	var httpParams = (params == null || params == '')?null:params;	//httpParams : name = 김삿갓
	var httpUrl = url;
	//GET 방식인 경우
	//httpURL = hello.jsp?name=김삿갓
	//POST 방식인 경우
	//httpURL = hello.jsp
	if(httpMethod == "GET" && httpParams != null){
		httpUrl = httpUrl + "?" +httpParams;
	}
	//준비하기
	//true : 비동기방식. (요청하는 것이 올때까지 기다리지 않고 하던 일을 하는 것)
	ajax.open(httpMethod,httpUrl,true);
	ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	//컨텐츠 타입을 설정해주는것
	//콜백함수 등록
	//콜백함수는 ajax 서버의 상태가 변경될 때 마다 호출되는 함수
	ajax.onreadystatechange = callback;
	//서버에 요청
	ajax.send(httpMethod =="POST"?httpParams:null);
}