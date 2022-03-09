public class ContactHandler{
    public void updateBlankAccount( List<Contact> blankAccContacts)
    {
        List<Contact> conList = new List<Contact>();
        for(Contact con:blankAccContacts)
        {
            if(con.Email == 'santosh@gmail.com')
            {
                con.AccountId='0012v00002V2hgu';
                conList.add(con);
                
            }
        }
        
    }

}