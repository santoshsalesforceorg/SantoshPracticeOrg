public class Company {
	public string companyName;
    public string ceo;
    public integer employeeCount;
    public Long revenue;
    private List<Client> customersList = new List<Client>();
    
    public void addNewCustomer(String clientName,String website,String email,Long phone){
        Client cust = new Client(clientName, website, email, phone);
        customersList.add(cust);
    }
    
    public void getAllCustomer(){
        for(Client clt:customersList){
            system.debug('Customer Name: '+clt.clientName+', Website: ' +clt.website+ ', Email: '+clt.email+', Phone: '+clt.phone);
        }
    }
    
    private class Client{
        public String clientName;
        public string website;
        public string email;
        public Long phone;
        
        Client(String clientName,String website,String email,Long phone){
            this.clientName = clientName;
            this.website = website;
            this.email = email;
            this.phone = phone;
                
        }
    }    
}