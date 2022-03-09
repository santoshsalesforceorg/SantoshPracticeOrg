public class HelloWorld{
    private String greeting = 'Hello World';
    
    
    public void printMessage (String msg){
        system.debug(msg);
    }
    
    public string getDay(integer dayNumber){
        string dayString = '';
        
        switch on dayNumber{
            when 0
            {
                dayString = 'Sunday';
            }
            when 1
            {
                dayString = 'Monday';
            }
            when 2
            {
                dayString = 'Tuesday';
            }
            when 3
            {
                dayString = 'Wednesday';
            }
            when 4
            {
                dayString = 'Thursday';
            }
            when 5
            {
                dayString = 'Friday';
            }
            when 6
            {
                dayString = 'Saturday';
            }
            when else{
                dayString = 'Invalid Day';
            }
            
        }
        return dayString;
    }
    public string getDay(String dayAbbre){
        switch on dayAbbre
        {
            when 'Sunday'
            {
                dayAbbre = 'Sun';
            }
            when 'Monday'
            {
                dayAbbre = 'Mon';
            }
            when 'Tuesday'
            {
                dayAbbre = 'Tue';
            }
            when 'Wednesday'
            {
                dayAbbre = 'Wed';
            }
            when 'Thursday'
            {
                dayAbbre = 'Thu';
            }
            when 'Friday'
            {
                dayAbbre = 'Fri';
            }
            when 'Saturday'
            {
                dayAbbre = 'Sat';
            }
            when else{
                dayAbbre = 'Invalid Day';
            }
            
        }
        
        return dayAbbre;
    }
}