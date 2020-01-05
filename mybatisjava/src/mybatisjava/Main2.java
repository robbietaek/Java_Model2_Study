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
		SqlSession session = sqlMap.openSession();	//Connection ���
		//student ���̺��� �� ���ڵ� �Ǽ� ����ϱ�
		int cnt = session.selectOne(NS+"count");
		System.out.println("student ���̺��� ���ڵ� �Ǽ� :"+ cnt);

		List<Student> list = session.selectList(NS+"list");
		for(Student s : list) {
			System.out.println(s);
		}
		Map<String,Object> map = new HashMap<>();
		
		System.out.println("student ���̺� ���ڵ� �߰��ϱ�");
		Student st = new Student();
		st.setStudno(1000);
		st.setName("ȫ�浿");
		st.setGrade(1);
		st.setId("hongkd");
		st.setJumin("123456");
		st.setMajor1(101);
		cnt = session.insert(NS+"insert",st);
		System.out.println("Student ���ڵ� �߰�"+ cnt);
		Student stu = session.selectOne(NS+"selectno",st.getStudno());
		System.out.println(stu);
		
		System.out.println("Student ���̺� ���ڵ� �����ϱ�");
		/*
		 * 1000���л��� �г��� 2�г����� ,������ 80, Ű�� 175�� 
		 * ����������ȣ��1001�� �����ϱ�
		 */
		
		Student st1 = new Student();
		st1.setStudno(st.getStudno());
		st1.setGrade(2);
		st1.setWeight(80);
		st1.setHeight(175);
		st1.setProfno(1001);
		cnt = session.update(NS+"update",st1);
		System.out.println("Student ���ڵ� ������Ʈ"+cnt);
		stu = session.selectOne(NS+"selectno",st1.getStudno());
		System.out.println(stu);
		
		
		
		/*
		 * ���� �达�� �л��� ��� ��ȸ�ϱ�
		 */
		
		list = session.selectList(NS+"select2","��");
		for(Student s : list) System.out.println(s);
		
		
		System.out.println("------------------------------");
		/*
		 * 101�а��� �л� �� 3�г� �̻��� �л��� ��� ��ȸ�ϱ�
		 */

		map.put("major1", 101);
		map.put("grade", 3);
		list = session.selectList(NS+"select3",map);
		for(Student s : list) System.out.println(s);
		

		/*
		 * �����԰� 75kg �̻��� �л��� ����� ��ȸ����
		 */
		System.out.println("�����԰� 75kg �̻��� �л�");
		map.clear();
		map.put("col", "weight");
		map.put("val", 75);
		list = session.selectList(NS+"select4",map);
		for(Student s : list) System.out.println(s);
		/*
		 * Ű�� 175�̻��� �л��� ����� ��ȸ�ϱ�
		 */
		System.out.println("Ű�� 175�̻��� �л��� ��� ��ȸ�ϱ�");
		map.clear();
		map.put("col", "height");
		map.put("val", 175);
		list = session.selectList(NS+"select4",map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("�г��� 2�г� �̻��� �л�");
		map.clear();
		map.put("col", "grade");
		map.put("val",2);
		list = session.selectList(NS+"select4",map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("�ֹι�ȣ ���� ���л�");
		map.clear();
		map.put("col", "substr(jumin,7,1)");
		map.put("val","2");
		list = session.selectList(NS+"select4",map);
		for(Student s : list) System.out.println(s);
		
		System.out.println("1000�� �л� �����ϱ�");
		map.clear();
		map.put("col", "studno");
		map.put("val", 1000);
		cnt = session.delete(NS+"delete",map);
		stu = session.selectOne(NS+"selectno",st.getStudno());
		System.out.println(stu);
		
		System.out.println("�������л� �����ϱ�");
		map.put("col", "name");
		map.put("val", "������");
		cnt = session.delete(NS+"delete",map);
		stu = session.selectOne(NS+"selectno",971211);
		System.out.println(stu);
		
	}
}
