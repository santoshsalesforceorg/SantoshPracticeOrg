import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME from '@salesforce/schema/Contact.Name';
import TITLE from '@salesforce/schema/Contact.Title';
import PHONE from '@salesforce/schema/Contact.Phone';
import EMAIL from '@salesforce/schema/Contact.Email';
import ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';

export default class RecordEditForm extends LightningElement {
    objContact = CONTACT_OBJECT;
    fields= {
        accField: ACCOUNT_FIELD,
        conName: NAME,
        conTitle: TITLE,
        conPhone: PHONE,
        conEmail: EMAIL
    };
}