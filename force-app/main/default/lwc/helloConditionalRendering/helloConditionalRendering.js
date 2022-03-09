import { LightningElement } from 'lwc';

export default class HelloConditionalRendering extends LightningElement {
    isVisible = false;
    name = "Ravi";
    handleClick(){
        this.isVisible = true;
    }
    changeHandler(event){
        this.name = event.target.value;
    }
    get hellowMethod(){
        return this.name==="hello";
    }
}