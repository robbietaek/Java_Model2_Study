package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.Member;

public class Main1 {

	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		
		try {
			//mapper ��Ű���� mybatis-config.xml�� �б�
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			//mybatis ȯ���� �о �����̳ʿ� ������.
			//1. connection ����
			//2. sql ���� ����
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		} catch(IOException e) {
			e.printStackTrace();
		}
		int x = 0;
		//Connection ���� session�Ҵ�
		SqlSession session = sqlMap.openSession();
		//selectOne : �����͸� db�� ���� ��ȸ�ϱ� : ����� ���ڵ� 1���� ���
		//member.count : sql ������ id�Ӽ� ��
		x = (Integer)session.selectOne("member.count");
		//member.list : �����͸� db�κ��� ��ȸ�ϱ� . : ����� �������ΰ��
		List<Member> list = session.selectList("member.list");
		for(Member m : list) {
			System.out.println(m);
		}
		
		Member m = session.selectOne("member.selectid","admin");
		System.out.println(m);
		System.out.println("�̸��� �׽�Ʈ1�� ����� ��ȸ�ϱ�");
		
		list = session.selectList("member.selectname","a");
		for(Member a : list) {
			System.out.println(a);
		}
		Map<String,Object> map = new HashMap<>();
		map.put("name", "abc");
		map.put("id", "abc");
		list = session.selectList("member.selectidname",map);
		for(Member mem : list) {
			System.out.println(mem);
		}
		
		System.out.println("member ���̺��� ���ڵ� ����" + x);
	}

}
