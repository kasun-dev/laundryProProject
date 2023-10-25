package com.laundrypro.users;

public class user {
	
	//private
	private String nic;
	private String name;
	private String uname;
	private String pwd;
	private String phoneNo;
	private String type;
	
	//constructor
	public user(String nic, String name, String uname, String pwd, String phoneNo, String type) {
		super();
		this.nic = nic;
		this.name = name;
		this.uname = uname;
		this.pwd = pwd;
		this.phoneNo = phoneNo;
		this.type = type;
	}
	
	//getters
	public String getNic() {
		return nic;
	}

	public String getName() {
		return name;
	}

	public String getUname() {
		return uname;
	}

	public String getPwd() {
		return pwd;
	}

	public String getphoneNo() {
		return phoneNo;
	}

	public String getType() {
		return type;
	}
	
	
}
