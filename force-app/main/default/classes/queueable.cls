public with sharing class queueable {
    String message;

    public Queueable(String message) {
        this.message = message;
    }

    public void execute(QueueableContext qc) {
        System.debug('Came into Queueablemethod.execute() @ ' + System.now() + '. message: ' + message);

        Queueable mqc1 = new Queueable('Dasaradh');
        Id asyncJobId = System.enqueueJob(mqc1);
    }
}