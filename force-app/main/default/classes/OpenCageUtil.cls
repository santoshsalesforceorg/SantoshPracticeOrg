global with sharing class OpenCageUtil {

    //https://api.opencagedata.com/geocode/v1/json?q=Rua+Cafel%C3%A2ndia%2C+Carapicu%C3%ADba%2C+Brasil&key=36737de430bd4358b4f8e57c00f15a85&pretty=1
    public static void forwardGeoCoding(Id recordId){
        String endPoint = system.label.OpenCageEndpoint;
        String apiKey = system.label.OpenCageKey;
        String errorMessage = '';

        Account accRec = [Select Id, Name, Location__latitude__s , Location__longitude__s ,ShippingStreet, ShippingState, ShippingPostalCode,
                          ShippingCountry, ShippingCity From Account Where Id =:recordId];
        
        String address = accRec.ShippingStreet+','+accRec.ShippingCity+','+accRec.ShippingState+','+accRec.ShippingPostalCode+','+
            +accRec.ShippingCountry;

        String finalEndpoint = endPoint+'q=Rua+Cafel%C3%A2ndia%2C+Carapicu%C3%ADba%2C+Brasil&key='+apiKey+'&pretty=1&limit=1';
        Http http = new Http();
        HttpRequest httpReq = new HttpRequest();
        httpReq.setMethod('GET');
        httpReq.setEndpoint(finalEndpoint);
        httpReq.setHeader('Content-Type','application/json');
        HttpResponse response = new HttpResponse();

        try {
            response = http.send(httpReq);
            if(response.getStatusCode()==200){
                String body = response.getBody();
                system.debug('Body--> '+body);
                OpenCageData openCage = (OpenCageData)System.JSON.deserialize(body, OpenCageData.class);
                List<OpenCageData.results> results = openCage.results;
                system.debug('Result->> '+results);
            }

        } catch (system.exception e) {
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                errorMessage = 'Unauthorized endpoint';
            }
            else {
                errorMessage = 'Else';
            }
            System.debug(system.loggingLevel.Debug,'Exception Executed '+errorMessage);
        }
    }
    }