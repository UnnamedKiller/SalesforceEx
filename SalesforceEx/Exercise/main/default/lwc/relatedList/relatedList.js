import { LightningElement, wire } from 'lwc';
import getRecords from '@salesforce/apex/RelatedListController.getRecords';
export default class RelatedList extends LightningElement {
    mapData = [];
      @wire(getRecords) 
    wireMapData({error, data}) {
        if (data) {
            console.log(data);
            var object = data;
            for(var key in object){
                this.mapData.push({value:object[key], key:key});
            }
        } else if (error) {
            this.error = error;
        }
    }
}