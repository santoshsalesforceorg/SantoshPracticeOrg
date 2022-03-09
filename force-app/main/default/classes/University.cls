public class University {
	public string uniName;
    public string city;
    public Course crs;
    public University(String cName, decimal f){
        uniName = 'Pune Univ';
        city = 'Pune';
        crs = new Course();
        crs.courseName = cName;
        crs.fee = f;
    }
    
    public class Course{
        public string courseName;
        public decimal fee;
    }
}