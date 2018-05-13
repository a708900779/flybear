package flybear.hziee.app.model;

import java.util.List;

public class UserRole {

	private Integer id;
	private Integer userId;
	private Integer roleId;

    public void setId(Integer id){
        this.id = id;
    }
    public Integer getId(){
        return this.id;
    }
    public void setUserId(Integer userId){
        this.userId = userId;
    }
    public Integer getUserId(){
        return this.userId;
    }
    public void setRoleId(Integer roleId){
        this.roleId = roleId;
    }
    public Integer getRoleId(){
        return this.roleId;
    }
}