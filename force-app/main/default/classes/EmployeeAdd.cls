public class EmployeeAdd{
	public string name;
	public decimal sal;
	public Address add;
	
	public EmployeeAdd(String name,Decimal sal, string city,String State, integer code){
	this.name = name;
	this.sal = sal;
	add = new Address();
	add.city = city;
	add.state = state;
	add.code = code;
	}
}