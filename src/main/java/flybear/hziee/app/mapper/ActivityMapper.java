package flybear.hziee.app.mapper;


import flybear.hziee.app.model.Activity;
import java.util.List;

public interface ActivityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Activity record);

    Activity selectByPrimaryKey(Integer id);

    List<Activity> selectAll();

    int updateByPrimaryKey(Activity record);
    
}