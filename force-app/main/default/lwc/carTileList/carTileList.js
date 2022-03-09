import { LightningElement, wire } from 'lwc';
import getCars from '@salesforce/apex/CarsController.getCars'
import {publish, subscribe, MessageContext,unsubscribe} from 'lightning/messageService'
import CARS_FILTERED_MESSAGE from '@salesforce/messageChannel/CarsFiltered__c'
import CAR_SELECTED_MESSAGE from '@salesforce/messageChannel/CarsSelected__c'

export default class CarTileList extends LightningElement {
cars=[];
error
filters = {};
carFilterSubscription
@wire(getCars, {filters:'$filters'})
carsHandler({data, error}){
    if(data){
        console.log(data)
        this.cars = data
        }
    if(error){
        this.error = error
        console.error(error)
        }
    }
    @wire(MessageContext)
    messageContext

    connectedCallback(){
        this.subscribeHandler()
    }
    subscribeHandler(){
        this.carFilterSubscription = subscribe(this.messageContext, CARS_FILTERED_MESSAGE, (message)=>this.handleFilterChanges(message))
    }
    handleFilterChanges(message){
        console.log(message.filters)
        this.filters ={...message.filters}
    }
    handleSelected(event){
        console.log("selected car id ",event.detail);
        publish(this.messageContext,CAR_SELECTED_MESSAGE,{
            carId:event.detail
        })
    }
    disconnectedCallback(){
        unsubscribe(this.carFilterSubscription);
        this.carFilterSubscription = null;
    }
}