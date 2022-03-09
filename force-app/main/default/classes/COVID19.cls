/**
 * Covid19 Class
 * Track covid19 recovery
 * */
public class COVID19 {
    public Integer recoveredInArea = 0;
    //static variable
    public static Integer recoveredInCountry = 0;
    
    public COVID19(Integer recoveredInArea){
        if(recoveredInArea<0){
        	this.recoveredInArea  = 0;
    	}
    	else{
            this.recoveredInArea = recoveredInArea;
            recoveredInCountry += recoveredInArea;
    	}
    }

    public void treatPatient(){
        recoveredInArea++;
        recoveredInCountry++;
    }
    public Integer getTreated(){
        return recoveredInArea;
    }

    // static method

    }