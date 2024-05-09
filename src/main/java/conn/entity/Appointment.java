package conn.entity;

public class Appointment {
	

	public String getMedicine1() {
		return medicine1;
	}
	public void setMedicine1(String medicine1) {
		this.medicine1 = medicine1;
	}
	public String getMedicine2() {
		return medicine2;
	}
	public void setMedicine2(String medicine2) {
		this.medicine2 = medicine2;
	}
	public String getMedicine3() {
		return medicine3;
	}
	public void setMedicine3(String medicine3) {
		this.medicine3 = medicine3;
	}
	public String getTest1() {
		return Test1;
	}
	public void setTest1(String test1) {
		Test1 = test1;
	}
	public String getTest3() {
		return Test3;
	}
	public void setTest3(String test3) {
		Test3 = test3;
	}
	public String getTest2() {
		return Test2;
	}
	public void setTest2(String test2) {
		Test2 = test2;
	}
	private int id;
	private int userId;
	private String fullName;
	private String gender;
	private String age;
	private String appoinDate;
	private String email;
	private String phNo;
	private String diseases;
	private int doctorId;
	private String address;
	private String status;
	private String medicine1;
	private String medicine2;
	private String medicine3;
	private String Test1;
	private String Test3;
	private String Test2;

	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Appointment(int userId, String fullName, String gender, String age, String appoinDate, String email,
			String phNo, String diseases, int doctorId, String address, String status,String medicine1,String medicine2,
			String medicine3,
			String Test1,String Test2,String Test3) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.gender = gender;
		this.age = age;
		this.appoinDate = appoinDate;
		this.email = email;
		this.phNo = phNo;
		this.diseases = diseases;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
		this.medicine1 = medicine1;
		this.medicine1 = medicine2;
		this.medicine1 = medicine3;
		this.Test1= Test1;
		this.Test1= Test2;
		this.Test1= Test3;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAppoinDate() {
		return appoinDate;
	}
	public void setAppoinDate(String appoinDate) {
		this.appoinDate = appoinDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhNo() {
		return phNo;
	}
	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}
	public String getDiseases() {
		return diseases;
	}
	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}