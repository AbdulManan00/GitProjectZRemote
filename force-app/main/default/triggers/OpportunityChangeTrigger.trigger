trigger OpportunityChangeTrigger on OpportunityChangeEvent(after insert) {
    OpportunityChangeEventHandler.handleOpportunityChangeEvent(trigger.new);
}
