global class StudentSoapService {
    webservice static Student__c getStudent(String studentId) {
        Student__c student = [SELECT Id, Name, Student_Name__c, Phone_Number__c, School__c FROM Student__c WHERE id=:studentId];
        return student;
    }
}