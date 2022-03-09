public class Flower {
    public static integer wilt (Integer numberOfPetals)
    {
        if(numberOfPetals >=1)
    {
        numberOfPetals--;
        system.debug('Test Complete');
    }
		return numberOfPetals;
    }
    public static void grow(Integer height,Integer maxHeight) 
    {
        height = height + 2;
        if(height>=maxHeight)
        {
            pollinate();
        }
    }
    public static void pollinate()
    {
        system.debug('Pollinating');
    }
     
}