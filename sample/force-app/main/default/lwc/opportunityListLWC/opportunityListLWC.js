// build in core module in ES6
import {
    LightningElement,
    track,
    wire
} from 'lwc';

import getAllOpps from '@salesforce/apex/OpportunityService.getALlOpp';

export default class OpportunityListLWC extends LightningElement {
    Name = "test";
    ready = true;

    @track columns = [{
            label: 'Id',
            fieldName: 'ID',
            type: 'ID',
            sortable: true
        },
        {
            label: 'Name',
            fieldName: 'Name',
            type: 'Text',
            sortable: true
        },
        {
            label: 'Stage',
            fieldName: 'StageName',
            type: 'Text',
            sortable: true
        }
    ];

    @track error;
    @track data;
    @wire(getAllOpps)
    wiredOpps({
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