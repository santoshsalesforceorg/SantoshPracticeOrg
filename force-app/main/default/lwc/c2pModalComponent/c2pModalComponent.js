import { LightningElement } from 'lwc';

export default class C2pModalComponent extends LightningElement {
    closeHandler(){
        const myCustEvent = new CustomEvent('close',
        {
            bubbles:true,
            detail:"Modal Closed Succesfully!!"
        });
        this.dispatchEvent(myCustEvent);
    }
    footerHandler(){
        console.log("footerHandler is Called");
    }
}