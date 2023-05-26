package CountryLayerTranzact.Flows.PostCountry;

import com.intuit.karate.junit5.Karate;

public class PostCountryRunner {
    @Karate.Test
    Karate testGetPet(){
        return Karate.run("UnitPostCountry").tags("@PostCountry1").karateEnv("STG").relativeTo(getClass());
    }
}
