import { LightningElement } from 'lwc';
import pubSub from 'c/pubSub';
export default class PubSubComponentA extends LightningElement {
    message;
    inputHandler(event){
        this.message = event.target.value;
    }
    publishHandler(){
        pubSub.publish('ComponentA',this.message);
    }

}