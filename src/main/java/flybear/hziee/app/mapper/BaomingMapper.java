package flybear.hziee.app.mapper;


import flybear.hziee.app.model.Baoming;
import java.util.List;

public interface BaomingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Baoming record);

    Baoming selectByPrimaryKey(Integer id);

    List<Baoming> selectAll();

    int updateByPrimaryKey(Baoming record);
    
}