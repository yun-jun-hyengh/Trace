package com.jajangso.model;

public class BmiVO {
	private String name;
	private String bgender;
	private double height;
	private double weight;
	private double bmi;
	private String result; // 비반인지 아닌지 판별하는 변수
	
	public void bmiresult() {
		this.bmi = Math.round(this.weight / (this.height * this.height) * 10000);
		if(this.bmi > 30.0) {
			this.result = "비만";
		} else if(this.bmi > 25.0) {
			this.result = "과체중";
		} else if(this.bmi > 18.0) {
			this.result = "정상";
		} else {
			this.result = "저체중";
		}
	}
	
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public double getBmi() {
		return bmi;
	}
	public void setBmi(double bmi) {
		this.bmi = bmi;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBgender() {
		return bgender;
	}
	public void setBgender(String bgender) {
		this.bgender = bgender;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	

}
