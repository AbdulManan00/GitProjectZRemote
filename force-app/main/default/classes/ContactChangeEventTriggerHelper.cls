public with sharing class ContactChangeEventTriggerHelper {
  public static void ChangeMethod(List<ContactChangeEvent> newEventsList) {
    List<Task> taskList = new List<Task>();
    for (ContactChangeEvent event : newEventsList) {
      System.debug('event==>' + event);
      EventBus.ChangeEventHeader header = event.ChangeEventHeader;
      System.debug('Header==> ' + header);

      if (header.changetype == 'CREATE') {
        for (String id : header.recordids) {
          Task t = new Task();
          t.Subject = 'New Contact Created';
          t.OwnerId = header.commituser;
          t.WhoId = id;
          taskList.add(t);
        }
        insert taskList;
      } else if (header.changetype == 'UPDATE') {
        for (String field : header.changedFields) {
          if (field == 'Email') {
            for (String id : header.recordids) {
                Task t = new Task();
                t.Subject = 'Email Updated';
                t.OwnerId = header.commituser;
                t.WhoId = id;
                taskList.add(t);
              }
          }
        }
      }
    }
    if (taskList.size()>0) {
        try {
            insert taskList;
        } catch (Exception e) {
            System.debug('Error in inserting tasks' + e.getMessage());
        }
    }
  }
  
//   public static void TaskCreation(EventBus.ChangeEventHeader header) {
//     for (String id : header.recordids) {
//       TaskCreation();
//       Task t = new Task();
//       t.OwnerId = header.commituser;
//       t.WhoId = id;
//     }
//   }
}
