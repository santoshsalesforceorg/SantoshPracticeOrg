import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {
    fullName = "Zero to Hero";
    title = "aura";
    changeHandler(event){
        this.title = event.target.value;
    }
    address={
        city:"Pune",
        postcode: 411222,
        State:'Maharashtra'
    }
    trackHandler(event){
        this.address = {...this.address, "city": event.target.value}
    }
    //getter exmaple
    users = ["John", "smith","paul"]
    num1 = 10;
    num2 = 20;
    get firstUser(){
        return this.users[0].toUpperCase();

    }
    get multiply(){
        return this.num1 * this.num2;
    }
}