package jsp.userInfo;

public class UserInfoBean {
	private String id;	//아이디
	private String name; //이름
	private String ph; //연락처
	private String area; //지역명
	private String CREATE_DATE; //생성일
	
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getPh() { return ph; }
	public void setPh(String ph) { this.ph = ph; }
	
	public String getArea() { return area; }
	public void setArea(String area) { this.area = area; }
	
	public String getCREATE_DATE() { return CREATE_DATE; }
	public void setCREATE_DATE(String cREATE_DATE) { CREATE_DATE = cREATE_DATE; }
}
