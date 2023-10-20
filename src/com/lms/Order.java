package com.lms;

import java.util.List;

public class Order {
	private String refNo;
    private double finalAmount;
    private double paidAmount;
    private String billDate;
    private String dueDate;
    private String state;

    public Order(String refNo, double finalAmount, double paidAmount, String billDate, String dueDate, String state) {
        this.refNo = refNo;
        this.finalAmount = finalAmount;
        this.paidAmount = paidAmount;
        this.billDate = billDate;
        this.dueDate = dueDate;
        this.state = state;
    }

	public String getRefNo() {
		return refNo;
	}

	public double getFinalAmount() {
		return finalAmount;
	}

	public double getPaidAmount() {
		return paidAmount;
	}

	public String getBillDate() {
		return billDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public String getState() {
		return state;
	}
	
	@Override
    public String toString() {
        return "Order{" +
                "refNo='" + refNo + '\'' +
                ", finalAmount=" + finalAmount +
                ", paidAmount=" + paidAmount +
                ", billDate='" + billDate + '\'' +
                ", dueDate='" + dueDate + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
	
	public static void main(String[]args)
	{
		
		List<Order> order = LMSDBUtil.orderDetails();

		for (Order order1 : order) {
		    System.out.println(order1);
		}
		
	}

}
