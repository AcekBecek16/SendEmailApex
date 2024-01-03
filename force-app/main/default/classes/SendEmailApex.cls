global without sharing class SendEmailApex {
    
    @invocableMethod(label = 'Send Email Using Apex')
    global static list<Result> SendEmailMethod(list<Request> listRequest) {

        List<Result> result = new List<Result>();

        Messaging.SingleEmailMessage setEmailMsg = new Messaging.SingleEmailMessage();
        List<Messaging.SingleEmailMessage> listEmailMsg = new List<Messaging.SingleEmailMessage>();

        setEmailMsg.setToAddresses(listRequest[0].reciepentIds);
        setEmailMsg.setReplyTo(listRequest[0].senderMail);
        setEmailMsg.setSenderDisplayName('Support Salesforce');
        setEmailMsg.setSubject(listRequest[0].Subject);
        setEmailMsg.setPlainTextBody(listRequest[0].Body);
        setEmailMsg.setHtmlBody(listRequest[0].Body);
        
        listEmailMsg.add(setEmailMsg);

        Messaging.sendEmail(listEmailMsg);
        

        return result;

    }

    global class Request{

        @InvocableVariable
        public String Subject;

        @InvocableVariable
        public String Body;

        @InvocableVariable
        public String targetObjectID;

        @InvocableVariable
        public list<String> reciepentIds;

        @InvocableVariable
        public list<String> ccReciepntIds;

        @InvocableVariable
        public String senderMail;

    }

    global class Result{

        @InvocableVariable
        public String statusCode;

        @InvocableVariable
        public String message;
    }
}