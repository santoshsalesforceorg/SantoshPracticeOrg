public class testMap {
    public static void mapMethod()
    {
   List<Account> acccList = new  List<Account> ();
   Account a = new Account();
   a.Name='Acme rest 1';
   a.BillingCity='New York';

Map<Integer, Account> map1 = new Map<Integer, Account> {};
map1.put(1, a);

Map<Integer, Account> map2 = map1.clone();
map1.get(1).BillingCity = 
'San Francisco';

System.assertEquals(
   'San Francisco',
   map1.get(1).BillingCity);

System.assertEquals(
   'San Francisco',
   map2.get(1).BillingCity);
    }

}