package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import mybatisjava.Student;

//mapper.StudentMapper3 네임스페이스 sql 구문
/*
 * interface 방식을 이용한 mybatis 사용
 * 메서드의 이름 : id 속성값. (이름이 같은데 속성이 다른 것을 mybatis 는 허용하지 않는다.) 메서드의 이름은 중복되면 안된다. 오버로딩이 불가능하다.
 * 				xml과 메서드 명이 같으면 안된다. 결국 유일한 메서드 이름이여야 한다. xml과 인터페이스는 하나라고 생각하면 된다.
 * 매개변수 : parameterType 속성값.  => 두개 이상의 변수 값을 매개변수로 지정 할 수 없다. MAP, bean 객체로 지정해야한다.
 * 리턴타입 : resultType 속성 값을 의미한다.
 */
public interface StudentMapper3 {
	@Select("select * from student")
	List<Student> select();	//mapper.StudentMapper3.select

}
