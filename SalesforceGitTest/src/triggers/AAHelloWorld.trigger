trigger AAHelloWorld on Lead (before update) {
    for (Lead l : Trigger.new) {
        l.FirstName = 'Hello';
        l.LastName  = 'World';
    }
}