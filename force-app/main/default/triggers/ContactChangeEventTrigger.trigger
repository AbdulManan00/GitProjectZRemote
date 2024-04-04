trigger ContactChangeEventTrigger on ContactChangeEvent(after insert) {
  if (Trigger.isAfter && Trigger.isInsert) {
    ContactChangeEventTriggerHelper.ChangeMethod(Trigger.new);
  }
}
