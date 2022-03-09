public class TestJsonClass {
    public static void jsonCnvert(){
     String Age;
    
     String jsonString = '{"name":"John", "age":30, "car":null}';
    //String deserialized = jsonString.JSON.deserialize(jsonString);
    Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
    Age = (String)results.get(age);
    }

}