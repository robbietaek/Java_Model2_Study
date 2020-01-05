package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Main2 {
	private final static String NS = "student.";
	private static SqlSessionFactory sqlMap;
	static {	//static 초기화 블럭	초기에 한번만 실행된다
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		} catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();	//Connection 기능
		//student 테이블의 총 레코드 건수 출력하기
		int cnt = session.selectOne(NS+"count");
		System.out.println("student 테이블의 레코드 건수 :"+ cnt);

		List<Student> list = session.selectList(NS+"list");
		for(Student s : list) {
			System.out.println(s);
		}
		Map<String,Object> map = new HashMap<>();
		
		System.out.println("student 테이블에 레코드 추가하기");
		Student st = new Student();
		st.setStudno(1000);
		st.setName("홍길동");
		st.setGrade(1);
		st.setId("hongkd");
		st.setJumin("123456");
		st.setMajor1(101);
		cnt = session.insert(NS+"insert",st);
		System.out.println("Student 레코드 추가"+ cnt);
		Student stu = session.selectOne(NS+"selectno",st.getStudno());
		System.out.println(stu);
		
		System.out.println("Student 테이블에 레코드 수정하기");
		/*
		 * 1000번학생의 학년을 2학년으로 ,몸무게 80, 키를 175로 
		 * 지도교수번호를1001로 수정하기
		 */
		
		Student st1 = new Student();
		st1.setStudno(st.getStudno());
		st1.setGrade(2);
		st1.setWeight(80);
		st1.setHeight(175);
		st1.setProfno(1001);
		cnt = session.update(NS+"update",st1);
		System.out.println("Student 레코드 업데이트"+cnt);
		stu = session.selectOne(NS+"selectno",st1.getStudno());
		System.out.println(stu);
		
		
		
		/*
		 * 성이 김씨인 학생의 목록 조회하기
		 */
		
		list = session.selectList(NS+"select2","김");
		for(Student s : list) System.out.println(s);
		
		
		System.out.println("------------------------------");
		/*
		 * 101학과의 학생 중 3학년 이상의 학생의 목록 조회하기
		 */

		map.put("major1", 101);
		map.put("grade", 3);
		list = session.selectList(NS+"select3",map);
		for(Student s : list) System.out.println(s);
		

		/*
		 * 몸무게가 75kg 이상인 학생의 목록을 조회하자
		 */
		System.out.println("몸무게가 75kg 이상인 학생");
		map.clear();
		map.put("col", "weight");
		map.put("val", 75);
		list = session.selectList(NS+"select4",map);
		for(Student s : list) System.out.println(s);
		/*
		 * 키가 175이상인 학생의 목록을 조회하기
		 */
		System.out.println("키가 175이상인 학생의 목록 조회하기");
		map.clear();
		map.put("col", "height");
		map.put("val", 175);
		list = session.selectList(NS+"select4",map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("학년이 2학년 이상인 학생");
		map.clear();
		map.put("col", "grade");
		map.put("val",2);
		list = session.selectList(NS+"select4",map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("주민번호 기준 여학생");
		map.clear();
		map.put("col", "substr(jumin,7,1)");
		map.put("val","2");
		list = session.selectList(NS+"select4",map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("1000번 학생 삭제하기");
		map.clear();
		map.put("col", "studno");
		map.put("val", 1000);
		cnt = session.delete(NS+"delete",map);
		stu = session.selectOne(NS+"selectno",st.getStudno());
		System.out.println(stu);
		
		System.out.println("유진성학생 삭제하기");
		map.put("col", "name");
		map.put("val", "유진성");
		cnt = session.delete(NS+"delete",map);
		stu = session.selectOne(NS+"selectno",971211);
		System.out.println(stu);
		
	}
}
