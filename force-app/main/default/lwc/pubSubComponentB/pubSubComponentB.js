import { LightningElement } from 'lwc';
import pubSub from 'c/pubSub';
export default class PubSubComponentB extends LightningElement {
    message;
    connectedCallback(){
        this.callSubsriber()     
    }
    callSubsriber(){
        pubSub.subscribe('ComponentA', (message)=>{
            this.message = message;
        })
    }
}