import { LightningElement } from 'lwc';

export default class HelloQuerySelector extends LightningElement {
    username = ["John", "Mike","Nik","Paul"];
    featchDetailsHandler(){
        const elem = this.template.querySelector('h1');
        const userElements = this.template.querySelectorAll('.name');
        console.log(elem.innerText);
        Array.from(userElements).forEach(item=>{
            console.log(item.innerText);
        })
    }
}