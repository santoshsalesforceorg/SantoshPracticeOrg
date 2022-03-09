import { LightningElement } from 'lwc';

export default class LifecycleParent extends LightningElement {
    name;
    isChildVisible = false;
    constructor(){
        super();
        console.log("Parent constructor is called");
    }
    connectedCallback(){
        console.log("Parent connectedCallback is called");
    }
    renderedCallback(){
        console.log("Parent renderedCallback is called");
    }
    handleClick(){
        this.isChildVisible = !this.isChildVisible;
    }
    errorCallback(error, stack){
        console.log(error.message);
        console.log(stack);
    }
}