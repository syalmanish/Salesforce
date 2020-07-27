import {
    LightningElement,
    track,
    wire
} from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountService.getAllAccounts';

export default class AccountListLWC extends LightningElement {

    @track columns = [{
            label: 'Name',
            fieldName: 'Name',
            type: 'Text'
        },
        {
            label: 'Phone',
            fieldName: 'Phone',
            type: 'Number'
        }
    ];

    @track error;
    @track data;

    @wire(getAllAccounts)
    wireAcct({
        error,
        data
    }) {
        if (data) {
            this.data = data;
        } else if (error) {
            this.error = error;
        }

    }

}