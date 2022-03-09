import { LightningElement,api } from 'lwc';

export default class SetterDemoChild extends LightningElement {
    userDetail;
    @api 
    get detail(){
        console.log('get method is called');
        return this.userDetail;  
    }
    set detail(data){
      let newAge = data.age*2;
        this.userDetail = {...data, age:newAge,"location":"Pune"};//shallow copy
        console.log("set method called");
    }
}