import com.intuit.karate.junit5.Karate;

public class recallTest {
    @Karate.Test
    Karate demo(){
        return Karate.run("C:\\Users\\HusseinAmadu\\Desktop\\stuff\\Karate\\src\\main\\resources\\recall.feature");
    }
}
