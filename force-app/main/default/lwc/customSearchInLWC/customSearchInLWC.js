import { LightningElement, track } from 'lwc';
import serachAccs from '@salesforce/apex/LWCExampleController.retriveAccs';

// datatable columns
const columns = [
    {
        label: 'Account Name',
        fieldName: 'Name',
        type: 'url',
        typeAttributes: {label: { fieldName: 'Rname' }, target: '_blank'}
    }, {
        label: 'Industry',
        fieldName: 'Industry',
    }, {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone',
    }, {
        label: 'Type Field',
        fieldName: 'Type'
    },
];
export default class CustomSearchInLWC extends LightningElement {
    @track searchData;
    @track columns = columns;
    @track errorMsg = '';
    strSearchAccName = '';
    

    handleAccountName(event) {
        this.strSearchAccName = event.detail.value;
    }

    handleSearch() {
        if(!this.strSearchAccName) {
            this.errorMsg = 'Please enter account name to search.';
            this.searchData = undefined;
            return;
        }

        serachAccs({strAccName : this.strSearchAccName})
        .then(result => {
                let tempList = [];
                result.forEach((record)=>{
                    let tempRec = Object.assign({},record);
                    console.log('tempRec-> '+tempRec);
                    tempRec.Name = '/' + tempRec.Id;
                    tempRec.Rname = record.Name;
                    tempList.push(tempRec);
                    console.log('tempRec-> '+tempRec);
                    console.log('tempList-> '+tempList);

                })
            
            this.searchData = tempList;
            console.table(this.searchData);
            
        })
        .catch(error => {
            this.searchData = undefined;
            window.console.log('error =====> '+JSON.stringify(error));
            if(error) {
                this.errorMsg = error.body.message;
            }
        }) 
    }

}