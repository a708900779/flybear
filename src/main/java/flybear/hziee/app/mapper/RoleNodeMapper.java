package flybear.hziee.app.mapper;

import java.util.List;

import flybear.hziee.app.model.RoleNode;

public interface RoleNodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleNode record);

    RoleNode selectByPrimaryKey(Integer id);

    int deleteByRoleId(Integer roleId);

    List<RoleNode> selectAll();

    int updateByPrimaryKey(RoleNode record);
}