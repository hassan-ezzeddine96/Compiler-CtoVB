package convertor;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Info {
    private JPanel panelMain;

    public Info() {

    }

    public static void main() {
        JFrame frame = new JFrame("Welcome");
        frame.setContentPane(new Info().panelMain);
        frame.pack();
        frame.setSize(650,830);
        frame.setVisible(true);
    }
}
