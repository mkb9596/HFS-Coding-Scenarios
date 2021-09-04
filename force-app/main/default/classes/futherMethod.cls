public with sharing class futherMethod {
    @future
    public static void futureCall1() {
        System.debug('futherMethod.futureCall1 ran at: ' + System.now());
    }

    @future
    public static void FutureCall2() {
        System.debug('futherMethod.futureCall1 ran at: ' + System.now());
    }
}
