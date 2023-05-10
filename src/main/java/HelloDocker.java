import java.text.SimpleDateFormat;
import java.util.Date;

public class HelloDocker {
    public static void main(String[] args) {
        innerLoop(50);
        System.out.println("You're very tired, Docker");
    }

    private static void innerLoop(int howMany) {
        if (howMany <= 0) return;
        int num = 0;
        while (num < howMany) {
            num ++;
            System.out.println("Wake up, Docker, it's " +
                    new SimpleDateFormat("HH:mm:ss").format(new Date())
                        + " (I'm telling you for the " + num
                        + (num%10 == 1 ? "st" : (num%10 == 2 ? "nd" : (num%10 == 3 ? "rd" : "th")))
                        + " time)");
            try {
                Thread.sleep(1000 + (num * 100));
            } catch (InterruptedException e) {
                System.err.println("Could not wake you up because... " + e.getMessage());
            }
        }
    }

}
