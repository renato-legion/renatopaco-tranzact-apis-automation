package CountryLayerTranzact.Flows.GetCountry;

import com.intuit.karate.junit5.Karate;

public class GetCountryRunner {
    @Karate.Test
    Karate testGetPet(){
        return Karate.run("UnitGetCountry").tags("@GetCountry1").karateEnv("STG").relativeTo(getClass());
    }
}
