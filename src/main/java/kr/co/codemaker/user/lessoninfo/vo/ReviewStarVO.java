package kr.co.codemaker.user.lessoninfo.vo;

public class ReviewStarVO {

	private int five;
	private int four;
	private int one;
	private int two;
	private int three;
	
	public int getFive() {
		return five;
	}
	public void setFive(int five) {
		this.five = five;
	}
	public int getFour() {
		return four;
	}
	public void setFour(int four) {
		this.four = four;
	}
	public int getOne() {
		return one;
	}
	public void setOne(int one) {
		this.one = one;
	}
	public int getTwo() {
		return two;
	}
	public void setTwo(int two) {
		this.two = two;
	}
	public int getThree() {
		return three;
	}
	public void setThree(int three) {
		this.three = three;
	}
	
	@Override
	public String toString() {
		return "ReviewStarVO [five=" + five + ", four=" + four + ", one=" + one + ", two=" + two + ", three=" + three
				+ "]";
	}
	
}
