package tests;

import com.intuit.karate.junit5.Karate;

public class SampleTest {
    @Karate.Test
    Karate testSample(){
        return Karate.run("Delete").relativeTo(getClass());
    }
    @Karate.Test
    Karate testTags(){
        return Karate.run("Get").tags("@smoke").relativeTo(getClass());
    }
}
