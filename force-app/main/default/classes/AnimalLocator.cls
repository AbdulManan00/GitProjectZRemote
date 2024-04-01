public class AnimalLocator {
    public static string getAnimalNameById(integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response=http.send(request);
                    System.debug('Received the following animals:'+response.getBody());

       Map<String, object> results = (Map<String, object>) JSON.deserializeUntyped(response.getBody());
                    System.debug('results::' + results );
             Map<string,object> animals = (map<string,object>) results.get('animal');
            System.debug('Received the following animals:' + animals );
            string animal = string.valueof(animals.get('name'));
            System.debug('Animal::' + animal );
            System.debug('Animallllllllllllll::' + animal );
            System.debug('Animallllllllllllll::' + animal );
            System.debug('Animallllllllllllll::' + animal );
            System.debug('Animallllllllllllll::' + animal );
          
        return animal;
    }
}