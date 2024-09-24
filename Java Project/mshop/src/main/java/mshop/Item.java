package mshop;

public class Item {
	private int id;
	private String name;
	private int price;
	private String details;
	private String image;
	
	public Item(String name, int price, String details, String image) {
		super();
		this.name = name;
		this.price = price;
		this.details = details;
		this.image = image;
	}


	public Item(int id, String name, int price, String details, String image) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.details = details;
		this.image = image;
	}
	
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public String getDetails() {
		return details;
	}
	public String getImage() {
		return image;
	}
	
	
	
	
}
