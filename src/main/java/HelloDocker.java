import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloDocker {
    public static void main(String[] args) {
        int num = 0;
        while (num < 300) {
            num ++;
            System.out.println("Wake up, Docker, it's " +
                    new SimpleDateFormat("HH:mm:ss").format(new Date()));
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                System.err.println("Could not sleep because... " + e.getMessage());
            }
        }
        System.out.println("See you later, Docker");
    }
}
