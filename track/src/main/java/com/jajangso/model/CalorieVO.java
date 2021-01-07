package com.jajangso.model;

public class CalorieVO {
	private String c_name; // 이름
	private String c_gender; // 성별
	private double c_height; // 키
	private double c_weight; // 몸무게
	private double GoalWeight; // 목표체중
	private int c_age; // 나이 
	private int Dday; // 체중감량기간 
	private String exercise; // 평소활동량 
	
	
	private double result1; // 기초대사량 결과값
	private double result2; // 활동대사량 결과값
	private double result3; // 하루필요에너지 결과값
	private double result4; // 표준체중
	private double result5; // 권장칼로리
	
	//하루소모칼로리 ???
	

	public double getResult5() {
		return result5;
	}
	public void setResult5(double result5) {
		this.result5 = result5;
	}
	public double getResult4() {
		return result4;
	}
	public void setResult4(double result4) {
		this.result4 = result4;
	}
	public double getResult3() {
		return result3;
	}
	public void setResult3(double result3) {
		this.result3 = result3;
	}
	public double getResult2() {
		return result2;
	}
	public void setResult2(double result2) {
		this.result2 = result2;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_gender() {
		return c_gender;
	}

	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
	}

	public double getC_height() {
		return c_height;
	}

	public void setC_height(double c_height) {
		this.c_height = c_height;
	}

	public double getC_weight() {
		return c_weight;
	}

	public void setC_weight(double c_weight) {
		this.c_weight = c_weight;
	}

	public double getGoalWeight() {
		return GoalWeight;
	}

	public void setGoalWeight(double goalWeight) {
		GoalWeight = goalWeight;
	}

	public int getC_age() {
		return c_age;
	}

	public void setC_age(int c_age) {
		this.c_age = c_age;
	}

	public int getDday() {
		return Dday;
	}

	public void setDday(int dday) {
		Dday = dday;
	}

	public String getExercise() {
		return exercise;
	}

	public void setExercise(String exercise) {
		this.exercise = exercise;
	}

	public double getResult1() {
		return result1;
	}

	public void setResult1(double result1) {
		this.result1 = result1;
	}
	
	public void rmr() { // 기초대사량 !! 
		switch(this.c_gender) {
		case "남성":
			this.result1 = (int)(66.47 + (13.75 * this.c_weight) + (5 * this.c_height) - (6.76 * this.c_age));
			break;
		case "여성":
			this.result1 = (int)(655.1 + (9.56 * this.c_weight) + (1.85 * this.c_height) - (4.68 * this.c_age));
			break;
		}
	}
	
	public void extisiting() { // 활동대사량
		switch(this.exercise) {
		case "1":
			this.result2 = (int)(this.result1 * 0.2);
			break;
		case "2":
			this.result2 = (int)(this.result1 * 0.375);
			break;
		case "3":
			this.result2 = (int)(this.result1 * 0.555);
			break;
		case "4":
			this.result2 = (int)(this.result1 * 0.725);
			break;
		case "5":
			this.result2 = (int)(this.result1 * 0.9);
			break;
		}
	}
	
	public void eatsiting() { // 하루필요에너지
		this.result3 = (int)(this.result1 + this.result2);
	}
	
	public void basicweight() { // 표준체중
		this.result4 = (int)(this.c_height - 100) * 0.9;
	}
	
	public void GoodCalo() { // 하루 권장 칼로리 계산
		switch(this.exercise) {
		case "1":
			this.result5 = (int)(this.result4 * 25);
			break;
		case "2":
			this.result5 = (int)(this.result4 * 25);
			break;
		case "3":
			this.result5 = (int)(this.result4 * 30);
			break;
		case "4":
			this.result5 = (int)(this.result4 * 35);
			break;
		case "5":
			this.result5 = (int)(this.result4 * 40);
			break;
		}
	}
	
}
