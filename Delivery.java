package manageTransportation;

public class Delivery {

	private int dNo;
	private String rNo;
	private int empId;
	private String date1;
	private String description1;
	private Double rate;
	private Double distance;
	private Double total;
	
	public Delivery() {
		super();
	}
	
	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public String getDescription1() {
		return description1;
	}

	public void setDescription1(String description1) {
		this.description1 = description1;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public Double getDistance() {
		return distance;
	}

	public void setDistance(Double distance) {
		this.distance = distance;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Delivery(int dNo, String rNo, int empId, String date1, String description1, Double rate, Double distance) {
		super();
		this.dNo = dNo;
		this.rNo = rNo;
		this.empId = empId;
		this.date1 = date1;
		this.description1 = description1;
		this.rate = rate;
		this.distance = distance;
	}
}
