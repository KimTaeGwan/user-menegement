package jsp.memberInfo;

public class MemberInfoBean {
	private String id;	//아이디
	private String pw;	// 비밀번호
	private String name;	//이름
	private String gender;	//성별
	private String birth;	//생일
	private String phone;	//전화번호
//	private Integer age;
//	private String filePath;	//파일경로
//	private String fileName;	//파일이름
	
	public String getId() {return id;}
	public void setId(String id) { this.id = id; }

	public String getPw() {	return pw; }
	public void setPw(String pw) {	this.pw = pw; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getGender() {	return gender; }
	public void setGender(String gender) { this.gender = gender; }
	
	public String getBirth() { return birth; }
	public void setBirth(String birth) { this.birth = birth; }
	
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	
//	public Integer getAge() { return age; }
//	public void setAge(Integer age) { this.age = age; }
//	
//	public String getFilePath() { return filePath; }
//	public void setFilePath(String filePath) { this.filePath = filePath; }
//	
//	public String getFileName() { return fileName; }
//	public void setFileName(String fileName) { this.fileName = fileName; }
}
