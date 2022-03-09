@isTest
public class Test_CoachActivity {
    static testMethod void Test_CoachActivity() {
        CoachActivity.Coach cochWrap = new CoachActivity.Coach();
        CoachActivity.RepEvaluation cochRepWrap = new CoachActivity.RepEvaluation();
        List<CoachActivity.RepEvaluation> cochRepWrapList = new List<CoachActivity.RepEvaluation>();
        CoachActivity ca = new CoachActivity();
        cochRepWrap.attribute = 'Test Attributes';
        cochRepWrap.attributeType = 'Test att Type';
        cochRepWrap.experience = 2.0;
        cochRepWrapList.add(cochRepWrap);


        cochWrap.coachName = 'Test';
        cochWrap.averageScore = 2.0;
        ca.Id = '14611164';
        ca.coach = cochWrap;
        ca.repEvaluation = cochRepWrapList;
    }
}