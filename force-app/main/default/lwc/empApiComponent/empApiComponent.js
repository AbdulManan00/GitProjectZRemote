import { LightningElement , track} from 'lwc';
import {
    subscribe,
    unsubscribe,
    onError,
    // setDebugFlag,
    // isEmpEnabled
} from 'lightning/empApi';

export default class EmpApiLWC extends LightningElement {
    @track msgBody = '';
    channelName = '/data/Student__ChangeEvent';
    isSubscribeDisabled = false;
    isUnsubscribeDisabled = !this.isSubscribeDisabled;

    subscription = {};

    // Tracks changes to channelName text field
    handleChannelName(event) {
        this.channelName = event.target.value;
    }

    // Initializes the component
    connectedCallback() {
        // Register error listener
        this.registerErrorListener();
    }

    // Handles subscribe button click
    handleSubscribe() {
        const messageCallback = function(response) {
            const ref=this;
            const payload = response.data.payload;
            const changeEventHeader = payload.ChangeEventHeader;
            const formattedMessage = {
                LastModifiedDate: payload.LastModifiedDate,
                Name: payload.Name,
                ChangeEventHeader: {
                    commitNumber: changeEventHeader.commitNumber,
                    commitUser: changeEventHeader.commitUser,
                    sequenceNumber: changeEventHeader.sequenceNumber,
                    entityName: changeEventHeader.entityName,
                    changeType: changeEventHeader.changeType,
                    changedFields: changeEventHeader.changedFields,
                    changeOrigin: changeEventHeader.changeOrigin,
                    transactionKey: changeEventHeader.transactionKey,
                    commitTimestamp: changeEventHeader.commitTimestamp,
                    recordIds: changeEventHeader.recordIds
                }
            };
            ref.msgBody = JSON.stringify(formattedMessage, null, 2);
            console.log("###New message received ", ref.msgBody);
            console.log('New message received: ', JSON.stringify(response));
            // Response contains the payload of the new message received
        };
        



        // const ref=this;
        // // Callback invoked whenever a new event message is received
        // const messageCallback = function (response) {
        //     ref.msgBody = JSON.stringify(response.data.payload);
        //     console.log("###Newyfyfjjjyjy message received ",JSON.stringify(response.data.payload.Name));
        //     console.log('New message received: ', JSON.stringify(response));
        //     // Response contains the payload of the new message received
        // };

        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName, -1, messageCallback).then((response) => {
            // Response contains the subscription information on subscribe call
            console.log('Subscription request sent to: ',JSON.stringify(response.channel));
            this.subscription = response;
            this.toggleSubscribeButton(true);
        });
    }

    // Handles unsubscribe button click
    handleUnsubscribe() {
        this.toggleSubscribeButton(false);

        // Invoke unsubscribe method of empApi
        unsubscribe(this.subscription, (response) => {
            console.log('unsubscribe() response: ', JSON.stringify(response));
            // Response is true for successful unsubscribe
        });
    }

    toggleSubscribeButton(enableSubscribe) {
        this.isSubscribeDisabled = enableSubscribe;
        this.isUnsubscribeDisabled = !enableSubscribe;
    }

    registerErrorListener() {
        // Invoke onError empApi method
        onError((error) => {
            console.log('Received error from server: ', JSON.stringify(error));
            // Error contains the server-side error
        });
    }
}