trigger contacts on Contact (before insert, after insert, before update, after update) {

    Account acc = [select id, Name from Account where Name = 'Get Cloudy'];
    if (Trigger.isBefore) {
        for (Contact c : Trigger.new ) {
            if (c.AccountId == null) {
                c.AccountId = acc.id;
            }
        }
    }
    System.debug('Trigger.isExecuting: ' + Trigger.isExecuting);
    System.debug('Trigger.size: ' + Trigger.size);
    System.debug('Trigger.operationType: ' + Trigger.operationType);
}