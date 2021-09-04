import { LightningElement, track, wire} from 'lwc';
import searchContacts from '@salesforce/apex/contactController.searchContacts';

export default class Contacts extends LightningElement {

    @track searchValue;


    @wire(searchContacts) wiredContacts;
    getContacts() {
        searchContacts()
        .then(contacts => {
            console.log('Got Contacts: ' + contacts.length);
        })
        .catch(error => {
            console.log(error)
        });
    }
    value = '';

    get options() {
        return [
            { label: 'All Contacts', value: 'option1' },
            { label: 'Search Pattern', value: 'option2' },
        ];
    }

    handleChange(event){
        const value = event.target.value;
        const searchEvent = new CustomEvent(
            'search',

            {
                detail: value
            }
        );

        this.dispatchEvent(searchEvent);
    }
}