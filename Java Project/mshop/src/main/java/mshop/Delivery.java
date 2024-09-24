package mshop;

public class Delivery {
	private int id;
	private String name;
	private String author;
	private String status;
	
	public Delivery(int id, String name, String author, String status) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.status = status;
	}
	
	public Delivery(String name, String author, String status) {
		super();
		this.name = name;
		this.author = author;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getAuthor() {
		return author;
	}
	public String getStatus() {
		return status;
	}
	
}
