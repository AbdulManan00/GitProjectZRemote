public with sharing class OpportunityChangeEventHandler {
  public static void handleOpportunityChangeEvent(List<OpportunityChangeEvent> newEvents) {
    List<Task> tasks = new List<Task>();
    System.debug('newEvnet::::'+newEvents);
  // Iterate through each event message.
  for (OpportunityChangeEvent event : newEvents) {
    // Get some event header fields
    EventBus.ChangeEventHeader header = event.ChangeEventHeader;
    System.debug('header:::'+header);

    if (header.changetype == 'UPDATE' && event.isWon == true) {
        System.debug('event.iswon::'+event.isWon);
    for (String id : header.recordids) {
        Task tk = new Task();
      tk.Subject = 'Follow up on won opportunities: ' + id;
      tk.OwnerId = header.CommitUser;
      tk.WhatId = id;
      tasks.add(tk);
    }
    }
    if (tasks.size() > 0) {
      insert tasks;
    }
  }
  }
}