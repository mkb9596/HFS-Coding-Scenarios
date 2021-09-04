public with sharing class schedule implements schedule  {
    public void execute(scheduleContext sc) {
        System.debug('Came into schedulemethod.execute() @ ' + System.now());
    }
}