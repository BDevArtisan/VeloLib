package AllTests;

import Rentable.Bike;
import Rentable.ElectricBike;

public class ElectricBikeTest extends BikeTest {
	
	public Bike createBike() {
		return new ElectricBike(); 
	}
}
