package repository;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import domain.Free;

public class FreeDAO {
	
	private SqlSessionFactory factory;
	
	private static FreeDAO dao = new FreeDAO();
	private FreeDAO() {
		try {
			// SqlSessionFactory 빌드
			String resource = "mybatis/config/mybatis-config.xml";
			InputStream in = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static FreeDAO getInstance() {
		return dao;
	}
	String mapper = "mybatis.mapper.free.";
	
	
	public List<Free> selectAllFrees() {
		SqlSession ss = factory.openSession();
		List<Free> students = ss.selectList(mapper + "selectAllFrees");
		ss.close();
		return students;
	}
	
	
	
	

	public int insertFree(Free free) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert(mapper + "insertFree", free);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	

	public int deleteFrees(int freeNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete(mapper + "deleteFrees", freeNo);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	
	public Free selectFreeByNo(int freeNo) {
		SqlSession ss = factory.openSession();
		Free student = ss.selectOne(mapper + "selectFreeByNo", freeNo);
		ss.close();
		return student;
	}

}
