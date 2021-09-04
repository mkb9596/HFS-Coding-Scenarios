import { LightningElement, track, wire } from 'lwc';
import searchContacts from '@salesforce/apex/contactController.searchContacts';

export default class RadioContact extends LightningElement {

    @track contactRecords;
    @track errors;

    @wire(searchContacts)
        wiredRecords({error, data}){
            console.log('Data', data);
            this.contactRecords =data;
            this.errors = error;
        }

    handleEvent(event){
        const eventVal = event.detail;
        console.log('Search Param',eventVal);
        searchContacts({
            searchParam : eventVal

        })

        .then(result => {

            console.log('Contact Record', result);
            this.contactRecords = result;
            this.errors = undefined;
            
        })

        .catch(error =>{

            console.log('Error',error);
            this.errors = error;
            this.contactRecords = undefined;
            
        })
    }

    value = '';

    get options() {
        return [
            { label: 'All Contacts', value: '1' },
            { label: 'Search Pattern', value: '2' },
        ];
    }

}