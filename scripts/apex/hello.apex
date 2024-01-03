SendEmailApex.Request request = new SendEmailApex.Request();
List<String> toAddress = new List<String>();
toAddress.add('azis@langitkreasi.com');

List<String> ccAddress = new List<String>();
ccAddress.add('nurazispakaya16@gmail.com');

request.Body = 'This Email From Apex';
request.ccReciepntIds = toAddress;
request.reciepentIds = ccAddress;
request.senderMail = 'azispakaya@gmail.com';
request.Subject = 'This Subject From Apex';

List<SendEmailApex.Request> listRequest = new List<SendEmailApex.Request>();
listRequest.add(request);

try {
    System.debug('Send Email Apex -> '+SendEmailApex.SendEmailMethod(listRequest));
} catch (Exception e) {
    System.debug('Excemption -> '+e);
}