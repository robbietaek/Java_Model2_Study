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
	static {	//static �ʱ�ȭ ��	�ʱ⿡ �ѹ��� ����ȴ�
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
		System.out.println("�л� ��ü ���ڵ� ��ȸ�ϱ�");
		List<Student> list = session.getMapper(StudentMapper3.class).select();		//Mapper ��� ���� sql ������ ������ �ִ� container��.
		for(Student s : list) System.out.println(s);								//�����ϸ� �������̽� ������� �����ϴ� ���� ����.
		
		System.out.println("xml��İ� �����ϰ� ȣ��");
		list = session.selectList(ns+"select");
		for(Student s : list) System.out.println();
	}
}
