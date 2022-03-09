import { LightningElement, api, wire } from 'lwc';
import getSimilarCars from '@salesforce/apex/CarsController.getSimilarCars';
import {getRecord} from 'lightning/uiRecordApi';
import MAKE_FIELD from '@salesforce/schema/Car__c.Make__c'
export default class SimilarCars extends LightningElement {
    @api recordId;
    similarCars;

    @wire(getRecord,{recordId:'$recordId', fields:[MAKE_FIELD]})
    car
    fetchSimilarCars(){
        getSimilarCars({
            carId:this.recordId,
            makeType:this.car.data.fields.Make__c.value
        }).then(result=>{
            this.similarCars = result
            console.log(this.similarCars);
        }).catch(error=>{
            console.error(error);
        })
    }
}