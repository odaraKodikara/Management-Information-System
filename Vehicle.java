package manageTransportation;

public class Vehicle {

	private String regNo;
	private String type;
	private String model;
	private Double price;
	private String insNo;
	
	
	
	public Vehicle() {
		super();
	}

	public Vehicle(String regNo, String type, String model, double price, String insNo) {
		super();
		this.regNo = regNo;
		this.type = type;
		this.model = model;
		this.price = price;
		this.insNo = insNo;
	}

	public Vehicle(String type, String model, Double price, String insNo) {
		super();
		this.type = type;
		this.model = model;
		this.price = price;
		this.insNo = insNo;
	}

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getInsNo() {
		return insNo;
	}

	public void setInsNo(String insNo) {
		this.insNo = insNo;
	}
	
	
	
	
}