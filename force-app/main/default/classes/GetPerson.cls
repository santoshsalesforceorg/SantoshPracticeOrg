public class GetPerson {
    public String id {get;set;}
    public String name {get;set;}

  public static List<getperson> parse(String jsonInput) {
    system.JSONParser parser = JSON.createParser(jsonInput);
    List<GetPerson> gpList = new List<GetPerson>();
    while(parser.nextToken() != JSONToken.END_ARRAY) { // we started with an array of objects
        GetPerson gp = new GetPerson();
        while(parser.nextToken() != JSONToken.END_OBJECT){ // loop through each object
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) { //token should be field name
                String attr = parser.getText(); //get the text of the field name
                parser.nextToken(); // move the pointer
                //start mapping the fields
                if(attr == 'id') { 
                    gp.id = parser.getText();
                } else if(attr == 'name') {
                    gp.name = parser.getText();
                } 
            }
        }
        gpList.add(gp);            
    }
    return gpList;   
   }  
}

/** Anonymouse
 String json = '[{\"id\":\"1\",\"name\":\"testName\"},{\"id\":\"2\",\"name\":\"testName1\"},{\"id\":\"3\",\"name\":\"testName2\"}]';
List<GetPerson> gpList = GetPerson.parse(json);
system.debug(gpList[0].id);
List<Account> acc = new List<Account>();
for(Integer i=0; i<gpList.size();i++){
    acc.add(new Account(
    name = gpList[i].name,
    AccountNumber = gpList[i].id
    ));
}
insert acc;
 */