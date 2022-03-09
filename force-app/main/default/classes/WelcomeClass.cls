@RestResource(urlMapping='/v1/Welcome/*')
global with sharing class WelcomeClass {
    global final static string WELCOME_MESSAGE = 'Welecome to SFDC Integration';

    @httpGet
    global static string greetingMessage() {
        return WELCOME_MESSAGE;
    }
}