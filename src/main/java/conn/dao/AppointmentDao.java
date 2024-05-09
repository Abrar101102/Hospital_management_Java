package conn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conn.entity.Appointment;

public class AppointmentDao {

	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addAppointment(Appointment ap) {
		boolean f = false;

		try {

			String sql = "insert into appointment(user_id,fullname,gender,age,appoindate,email,phno,diseases,doctor_id,address,status,medicine1,medicine2,medicine3,Test1,Test2,Test3) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getFullName());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppoinDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhNo());
			ps.setString(8, ap.getDiseases());
			ps.setInt(9, ap.getDoctorId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());
			ps.setString(12, ap.getMedicine1());
			ps.setString(13, ap.getMedicine2());
			ps.setString(14, ap.getMedicine3());
			ps.setString(15, ap.getTest1());
			ps.setString(16, ap.getTest2());
			ps.setString(17, ap.getTest3());
			

			

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public List<Appointment> getAllAppointmentByLoginUser(int userId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {

			String sql = "select * from appointment where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				ap.setMedicine1(rs.getString(13));
				ap.setMedicine2(rs.getString(14));
				ap.setMedicine3(rs.getString(15));
				ap.setTest1(rs.getString(16));
				ap.setTest2(rs.getString(17));
				ap.setTest3(rs.getString(18));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean updateCommentStatus(int id, int doctId, String comm,String m1,String m2,String m3,String t1,String t2,String t3) {
		boolean f = false;
		try {
			String sql = "update appointment set status=?,medicine1=?,medicine2=?,medicine3=?,Test1=?,Test2=?,Test3=? where id=? and doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setString(2, m1);
			ps.setString(3, m2);
			ps.setString(4, m3);
			ps.setString(5, t1);
			ps.setString(6, t2);
			ps.setString(7, t3);
			ps.setInt(8, id);
			ps.setInt(9, doctId);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {

			String sql = "select * from appointment where doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, doctorId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				ap.setMedicine1(rs.getString(13));
				ap.setMedicine2(rs.getString(14));
				ap.setMedicine3(rs.getString(15));
				ap.setTest1(rs.getString(16));
				ap.setTest2(rs.getString(17));
				ap.setTest3(rs.getString(18));
				
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Appointment getAppointmentById(int id) {

		Appointment ap = null;

		try {

			String sql = "select * from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				ap.setMedicine1(rs.getString(13));
				ap.setMedicine2(rs.getString(14));
				ap.setMedicine3(rs.getString(15));
				ap.setTest1(rs.getString(16));
				ap.setTest2(rs.getString(17));
				ap.setTest3(rs.getString(18));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ap;
	}
	public List<Appointment> getAllAppointment() {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {

			String sql = "select * from appointment order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				ap.setMedicine1(rs.getString(13));
				ap.setMedicine2(rs.getString(14));
				ap.setMedicine3(rs.getString(15));
				ap.setTest1(rs.getString(16));
				ap.setTest2(rs.getString(17));
				ap.setTest3(rs.getString(18));
				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
