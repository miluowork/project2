package dao;

import org.apache.ibatis.annotations.Select;

public interface BasicDao {
	@Select("select @@identity ")
	public int Maxid();
}
