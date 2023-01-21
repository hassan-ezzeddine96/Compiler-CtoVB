package convertor;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

public class Welcome {
    private JPanel panelMain;
    private JButton Btn1;
    private JButton Btn2;

    public Welcome() {
        Btn1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                Convert conv = new Convert();
                conv.main();
            }
        });
        Btn2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                Info inf = new Info();
                inf.main();
            }
        });
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Welcome");
        frame.setContentPane(new Welcome().panelMain);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setSize(1000,600);
        frame.setVisible(true);
    }
}
