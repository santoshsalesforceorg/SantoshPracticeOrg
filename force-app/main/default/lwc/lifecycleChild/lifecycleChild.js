import { LightningElement } from 'lwc';

export default class LifecycleChild extends LightningElement {
    constructor(){
        super();
        console.log("Child constructor is called");
    }
    connectedCallback(){
        console.log("Child connectedCallback is called");
        window.addEventListener('click', this.handleClick);
        throw new Error('Loading of child comp failed');
    }
    renderedCallback(){
        console.log("Child renderedCallback is called");
    }
    disconnectedCallback(){
        alert('Child disconnectedCallback called !!');
        window.removeEventListener('click',this.handleClick)
    }
}