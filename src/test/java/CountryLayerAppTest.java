import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class CountryLayerAppTest {
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:CountryLayerTranzact")
                .tags("~@ignore")
                //.outputCucumberJson(true)
                .parallel(0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
