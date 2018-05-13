package flybear.hziee.app.model;

import java.util.List;

public class Question {

	private Integer id;
	private String questionTitle;
	private String questionContent;
	private String sponsorId;
	private Integer releaseTime;
	private String answer;
	private Integer answererId;
	private Integer questionType;

    public void setId(Integer id){
        this.id = id;
    }
    public Integer getId(){
        return this.id;
    }
    public void setQuestionTitle(String questionTitle){
        this.questionTitle = questionTitle;
    }
    public String getQuestionTitle(){
        return this.questionTitle;
    }
    public void setQuestionContent(String questionContent){
        this.questionContent = questionContent;
    }
    public String getQuestionContent(){
        return this.questionContent;
    }
    public void setSponsorId(String sponsorId){
        this.sponsorId = sponsorId;
    }
    public String getSponsorId(){
        return this.sponsorId;
    }
    public void setReleaseTime(Integer releaseTime){
        this.releaseTime = releaseTime;
    }
    public Integer getReleaseTime(){
        return this.releaseTime;
    }
    public void setAnswer(String answer){
        this.answer = answer;
    }
    public String getAnswer(){
        return this.answer;
    }
    public void setAnswererId(Integer answererId){
        this.answererId = answererId;
    }
    public Integer getAnswererId(){
        return this.answererId;
    }
    public void setQuestionType(Integer questionType){
        this.questionType = questionType;
    }
    public Integer getQuestionType(){
        return this.questionType;
    }
}