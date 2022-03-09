import { LightningElement } from 'lwc';

export default class Looping extends LightningElement {
    carList = ["Ford","Maruti", "Tata", "Mahindra"];
    ceoList = [
        {
            id:1,
            company:"Google",
            name:"Sundar Pichai"
        },
        {
            id:2,
            company:"Amazon",
            name:"Jeff Bezos"
        },
        {
            id:3,
            company:"Tesla",
            name:"Elon Musk"
        },
        {
            id:4,
            company:"Apple",
            name:"Tim Cook"
        }
    ]
}