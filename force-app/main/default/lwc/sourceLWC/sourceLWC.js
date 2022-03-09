import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
 
export default class SourceLWC extends NavigationMixin(LightningElement) {
    // navigate to another LWC without Aura
    navitageToLWCWithoutAura(event) {
        event.preventDefault();
        let componentDef = {
            componentDef: "c:customSearchInLWC",
            attributes: {
                label: 'Navigated From Another LWC Without Using Aura'
            }
        };
        // Encode the componentDefinition JS object to Base64 format to make it url addressable
        let encodedComponentDef = btoa(JSON.stringify(componentDef));
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: '/one/one.app#' + encodedComponentDef
            }
        });
    }
 
    // navigate to another LWC using Aura
    navitageToAppPage() {
        this[NavigationMixin.GenerateUrl]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'Car_Explorer'
            },
        }).then(url=>{
            window.open(url,"_blank");
        });
    }
}