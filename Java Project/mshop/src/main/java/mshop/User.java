package mshop;

public class User {
	private int id=6;
	private String name;
	private String number;
	

	public User(String name, String number) {
		super();
		this.name = name;
		this.number = number;
	}
	public User(int id, String name, String number) {
		super();
		this.id = id;
		this.name = name;
		this.number = number;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getNumber() {
		return number;
	}
	
	
}
