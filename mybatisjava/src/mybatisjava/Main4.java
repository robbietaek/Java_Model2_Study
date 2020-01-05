package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.StudentMapper3;

public class Main4 {
	private final static String ns = "mapper.StudentMapper3.";
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
		SqlSession session = sqlMap.openSession();
		System.out.println("학생 전체 레코드 조회하기");
		List<Student> list = session.getMapper(StudentMapper3.class).select();		//Mapper 라는 것은 sql 구문을 가지고 있는 container다.
		for(Student s : list) System.out.println(s);								//가능하면 인터페이스 방식으로 사응하는 것이 좋다.
		
		System.out.println("xml방식과 동일하게 호출");
		list = session.selectList(ns+"select");
		for(Student s : list) System.out.println();
	}
}
