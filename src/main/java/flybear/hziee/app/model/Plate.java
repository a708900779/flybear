package flybear.hziee.app.model;

import java.util.List;

public class Plate {

	private Integer id;
	private String plateName;
	private Integer plateManager;
	private Integer projectNum;
	private Integer lastEditTime;

    public void setId(Integer id){
        this.id = id;
    }
    public Integer getId(){
        return this.id;
    }
    public void setPlateName(String plateName){
        this.plateName = plateName;
    }
    public String getPlateName(){
        return this.plateName;
    }
    public void setPlateManager(Integer plateManager){
        this.plateManager = plateManager;
    }
    public Integer getPlateManager(){
        return this.plateManager;
    }
    public void setProjectNum(Integer projectNum){
        this.projectNum = projectNum;
    }
    public Integer getProjectNum(){
        return this.projectNum;
    }
    public void setLastEditTime(Integer lastEditTime){
        this.lastEditTime = lastEditTime;
    }
    public Integer getLastEditTime(){
        return this.lastEditTime;
    }
}