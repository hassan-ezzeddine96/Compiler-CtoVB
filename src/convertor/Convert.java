package convertor;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.io.*;

public class Convert {
    private JTextArea textc;
    private JTextArea textvb;
    private JPanel panelMain;
    private JButton Btn;

    public Convert() {
        Btn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                try (FileWriter writer = new FileWriter(new File("input.txt"), false)) {
                    writer.write(textc.getText());
                    Process process = Runtime.getRuntime().exec("/bin/bash -i run.sh");
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                    String line = bufferedReader.readLine();
                    JOptionPane.showMessageDialog(null, line);
                    while(line != null){
                        textvb.setText(line);
                        line = bufferedReader.readLine();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public static void main() {
        JFrame frame = new JFrame("Convertor");
        frame.setContentPane(new Convert().panelMain);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setSize(1000,600);
        frame.setVisible(true);
    }
}
//    Process process = Runtime.getRuntime().exec(new String[] {"/bin/bash", "-c", myfile.getPath()});
//String []command ={"/bin/bash","-i", "../run.sh"};
//    Process process = Runtime.getRuntime().exec(command,null,new
//            File("/home/wissam/IdeaProjects/CVBconverter"));