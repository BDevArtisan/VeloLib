package AllTests;

import Rentable.Bike;
import Rentable.ClassicBike;

public class ClassicBikeTest extends BikeTest {
	
	public Bike createBike() {
		return new ClassicBike(); 
	}
}