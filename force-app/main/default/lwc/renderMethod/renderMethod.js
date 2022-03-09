import { LightningElement } from 'lwc';
import signinTemplate from './signinTemplate.html'
import signupTemplate from './signupTemplate.html'
import renderTemplate from './renderMethod.html'
export default class RenderMethod extends LightningElement {
    selectedBtn=''; 
    render(){
        return this.selectedBtn === 'Sign up' ?  signupTemplate : 
            this.selectedBtn === 'Sign In' ? signinTemplate : renderTemplate
    }
    handleClick(event){
        this.selectedBtn = event.target.label;
    }
    submitHandler(event){
        console.log(`${event.target.label} successfully!!`);
    }
}