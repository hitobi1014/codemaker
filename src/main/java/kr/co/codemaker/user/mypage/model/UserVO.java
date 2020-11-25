package kr.co.codemaker.user.mypage.model;

public class UserVO {

	String user_id;         //회원의 아이디(이메일)
	String user_pass;       //회원의 비밀번호
	String user_nm;         //회원의 이름
	String user_tel;        //회원의 전화번호
	String user_profile;    //회원의 프로필
	String user_out;        //회원의 탈퇴여부
	String user_black;      //회원의 블랙여부
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_profile() {
		return user_profile;
	}
	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}
	public String getUser_out() {
		return user_out;
	}
	public void setUser_out(String user_out) {
		this.user_out = user_out;
	}
	public String getUser_black() {
		return user_black;
	}
	public void setUser_black(String user_black) {
		this.user_black = user_black;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((user_black == null) ? 0 : user_black.hashCode());
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
		result = prime * result + ((user_nm == null) ? 0 : user_nm.hashCode());
		result = prime * result + ((user_out == null) ? 0 : user_out.hashCode());
		result = prime * result + ((user_pass == null) ? 0 : user_pass.hashCode());
		result = prime * result + ((user_profile == null) ? 0 : user_profile.hashCode());
		result = prime * result + ((user_tel == null) ? 0 : user_tel.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserVO other = (UserVO) obj;
		if (user_black == null) {
			if (other.user_black != null)
				return false;
		} else if (!user_black.equals(other.user_black))
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		if (user_nm == null) {
			if (other.user_nm != null)
				return false;
		} else if (!user_nm.equals(other.user_nm))
			return false;
		if (user_out == null) {
			if (other.user_out != null)
				return false;
		} else if (!user_out.equals(other.user_out))
			return false;
		if (user_pass == null) {
			if (other.user_pass != null)
				return false;
		} else if (!user_pass.equals(other.user_pass))
			return false;
		if (user_profile == null) {
			if (other.user_profile != null)
				return false;
		} else if (!user_profile.equals(other.user_profile))
			return false;
		if (user_tel == null) {
			if (other.user_tel != null)
				return false;
		} else if (!user_tel.equals(other.user_tel))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pass=" + user_pass + ", user_nm=" + user_nm + ", user_tel="
				+ user_tel + ", user_profile=" + user_profile + ", user_out=" + user_out + ", user_black=" + user_black
				+ "]";
	}
	
	
	
}
