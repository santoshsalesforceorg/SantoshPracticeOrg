@isTest
public class FitnessTest {
    @isTest
    public static void calculateBMITest1(){
		Decimal weight  = 60;
        Decimal height = 1.2;  
        Decimal result = Fitness.calculateBMI(weight, height);
        result = result.setScale(2);
        system.assertEquals(41.67, result,'BMI Should be 41.67');
    }
    @isTest
    public static void calculateBMITest2(){
		Decimal weight  = 0;
        Decimal height = 1.2;  
        Decimal result = Fitness.calculateBMI(weight, height);
        system.assertEquals(0, result,'BMI Should be 41.67');
    }
    @isTest
    public static void calculateBMITest3(){
		Decimal weight  = 60;
        Decimal height = 0;  
        Decimal result = Fitness.calculateBMI(weight, height);
        system.assertEquals(-1, result,'BMI Should be 41.67');
    }
    @isTest
    public static void calculateBMITest4(){
		Decimal weight  = 60;
        Decimal height = -1.2;  
        Decimal result = Fitness.calculateBMI(weight, height);
        system.assertEquals(-1, result,'BMI Should be 41.67');
    }

}