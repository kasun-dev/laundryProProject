package com.lms;

public class User {
	private String nic;
	private String name;
	private String userName;
	private String password;
	private String address;
	private String type;
	
	public User(String nic, String name, String userName, String password, String address, String type) {
		super();
		this.nic = nic;
		this.name = name;
		this.userName = userName;
		this.password = password;
		this.address = address;
		this.type = type;
	}

	public String getNic() {
		return nic;
	}

	public String getName() {
		return name;
	}

	public String getUserName() {
		return userName;
	}

	public String getPassword() {
		return password;
	}


	public String getAddress() {
		return address;
	}

	public String getType() {
		return type;
	}
}
