package kr.happyjob.study.direction.model;


//사용자정보테이블
public class TB_userinfo {
	
	private String loginID;			//PK : 사번
	private String user_type;		//사용자 구분 : 
	private String name; 			//이름
	private String password;		//비밀번호
	private String sex;				//성별
	private String hp;				//연락처
	private String email;			//이메일
	private String regdate;			//가입일자
	private String zip_code;		//우편번호
	private String addr;			//주소
	private String addr_detail;		//상세주소
	private String birthday;		//생년월일
	private String dept_code;		//부서코드
	private String pos_code;		//직급코드
	private String job_code;		//직무코드
	private String school;			//최종학력
	private String emp_date;		//입사일자
	private String leave_date; 		//퇴사일자
	private String leave_reason;	//퇴사사유
	private String empl_status;		//재직상태
	private int avail_day;			//연차사용일
	private String status_yn;		//상태(승인여부)
	
	//파일관련
	private String file_name;		//파일이름		
	private String phsycal_path;	//물리경로
	private String logical_path;	//논리경로
	private int file_size;			//파일크기
	private String file_ext;		//??
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getPos_code() {
		return pos_code;
	}
	public void setPos_code(String pos_code) {
		this.pos_code = pos_code;
	}
	public String getJob_code() {
		return job_code;
	}
	public void setJob_code(String job_code) {
		this.job_code = job_code;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getEmp_date() {
		return emp_date;
	}
	public void setEmp_date(String emp_date) {
		this.emp_date = emp_date;
	}
	public String getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}
	public String getLeave_reason() {
		return leave_reason;
	}
	public void setLeave_reason(String leave_reason) {
		this.leave_reason = leave_reason;
	}
	public String getEmpl_status() {
		return empl_status;
	}
	public void setEmpl_status(String empl_status) {
		this.empl_status = empl_status;
	}
	public int getAvail_day() {
		return avail_day;
	}
	public void setAvail_day(int avail_day) {
		this.avail_day = avail_day;
	}
	public String getStatus_yn() {
		return status_yn;
	}
	public void setStatus_yn(String status_yn) {
		this.status_yn = status_yn;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getPhsycal_path() {
		return phsycal_path;
	}
	public void setPhsycal_path(String phsycal_path) {
		this.phsycal_path = phsycal_path;
	}
	public String getLogical_path() {
		return logical_path;
	}
	public void setLogical_path(String logical_path) {
		this.logical_path = logical_path;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getFile_ext() {
		return file_ext;
	}
	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}
	
	

}
