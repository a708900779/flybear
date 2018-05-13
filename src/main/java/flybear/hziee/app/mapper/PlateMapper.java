package flybear.hziee.app.mapper;


import flybear.hziee.app.model.Plate;
import java.util.List;

public interface PlateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Plate record);

    Plate selectByPrimaryKey(Integer id);

    List<Plate> selectAll();

    int updateByPrimaryKey(Plate record);
    
}