import { LightningElement,api } from 'lwc';

export default class PtocAlertComponent extends LightningElement {
    @api message;
    @api cardHeading;
    @api number;
    @api isValid;
}