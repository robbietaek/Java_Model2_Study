package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import mybatisjava.Student;

//mapper.StudentMapper3 ���ӽ����̽� sql ����
/*
 * interface ����� �̿��� mybatis ���
 * �޼����� �̸� : id �Ӽ���. (�̸��� ������ �Ӽ��� �ٸ� ���� mybatis �� ������� �ʴ´�.) �޼����� �̸��� �ߺ��Ǹ� �ȵȴ�. �����ε��� �Ұ����ϴ�.
 * 				xml�� �޼��� ���� ������ �ȵȴ�. �ᱹ ������ �޼��� �̸��̿��� �Ѵ�. xml�� �������̽��� �ϳ���� �����ϸ� �ȴ�.
 * �Ű����� : parameterType �Ӽ���.  => �ΰ� �̻��� ���� ���� �Ű������� ���� �� �� ����. MAP, bean ��ü�� �����ؾ��Ѵ�.
 * ����Ÿ�� : resultType �Ӽ� ���� �ǹ��Ѵ�.
 */
public interface StudentMapper3 {
	@Select("select * from student")
	List<Student> select();	//mapper.StudentMapper3.select

}
