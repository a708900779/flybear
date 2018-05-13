package flybear.hziee.app.mapper;

import java.util.List;

import flybear.hziee.app.model.ActionNode;

public interface ActionNodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ActionNode record);

    ActionNode selectByPrimaryKey(Integer id);

    List<ActionNode> selectAll();

    int updateByPrimaryKey(ActionNode record);
}