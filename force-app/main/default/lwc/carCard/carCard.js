import { LightningElement, wire } from 'lwc';
import CAR_OBJECT from '@salesforce/schema/Car__c'
import NAME_FIELD from '@salesforce/schema/Car__c.Name'
import PICTURE_URL_FIELD from '@salesforce/schema/Car__c.Picture_URL__c'
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c'
import MAKE_FIELD from '@salesforce/schema/Car__c.Make__c'
import MSRP_FIELD from '@salesforce/schema/Car__c.MSRP__c'
import FUEL_TYPE_FIELD from '@salesforce/schema/Car__c.Fuel_Type__c'
import SEATS_FIELD from '@salesforce/schema/Car__c.Number_of_Seats__c'
import CONTROL_FIELD from '@salesforce/schema/Car__c.Control__c'
import {getFieldValue} from 'lightning/uiRecordApi'
import CAR_SELECTED_MESSAGE from '@salesforce/messageChannel/CarsSelected__c'
import {subscribe, MessageContext, unsubscribe} from 'lightning/messageService'
import {NavigationMixin} from 'lightning/navigation'
export default class CarCard extends NavigationMixin(LightningElement) {
    @wire(MessageContext)
    messageContext
    categoryField = CATEGORY_FIELD;
    makeField = MAKE_FIELD;
    msrpField = MSRP_FIELD;
    fuelTypeField = FUEL_TYPE_FIELD;
    seatsField = SEATS_FIELD;
    controlField = CONTROL_FIELD;
    recordId;

    carName;
    carPictureUrl;
    carSelectionSubscription;// start from 12.09 Udemy

    handleRecordLoaded(event){
        const {records} = event.detail
        const recordData = records[this.recordId]
        this.carName = getFieldValue(recordData, NAME_FIELD)
        this.carPictureUrl = getFieldValue(recordData, PICTURE_URL_FIELD)
    }
    connectedCallback(){
        this.subscribeHandler()
    }
    subscribeHandler(){
    this.carSelectionSubscription = subscribe(this.messageContext,CAR_SELECTED_MESSAGE,(message)=>this.handleCarsSelected(message))
    }
    handleCarsSelected(message){
        this.recordId = message.carId;
    }
    disconnectedCallback(){
        unsubscribe(this.carSelectionSubscription);
        this.carSelectionSubscription = null;
    }
    handleNaviagateToRecord(){
        this[NavigationMixin.Navigate]({ 
            type:'standard__recordPage',
            attributes:{ 
                recordId:this.recordId,
                objectApiName:CAR_OBJECT.objectApiName,
                actionName:'view'

            }
        })
    }
}