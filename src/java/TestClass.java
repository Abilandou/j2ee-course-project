/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author godlove
 */


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
/**
 * Simple demo that uses java.util.Timer to schedule a task 
 * to execute once 5 seconds have passed.
 */

public class TestClass {
    public static void main(String args[]){
    Timer timer;
    String now = "2017-12-08";
    String den = "2017-12-19";
    SimpleDateFormat dateformat = new SimpleDateFormat ("E    yyyy.MM.dd"); //SDF to display output with day of week

    Date displaydate1=new Date(now); //Turning the inputed date from string
                                       //to date format to be used for the output
    Date displaydate2=new Date(den);

      int differenceInDays = (int) ((displaydate2.getTime() - displaydate1.getTime())/(1000*60*60*24));//common method to calculate number of days

    System.out.println("Between " +dateformat.format(displaydate1)+ " and " +dateformat.format(displaydate2)+ " there are " +differenceInDays+ " days");
    }
    

//    public TestClass(int seconds) {
//        timer = new Timer();
//        timer.schedule(new RemindTask(), seconds*1000);
//	}
//
//    class RemindTask extends TimerTask {
//        public void run() {
//            System.out.println("Time's up!");
//            timer.cancel(); //Terminate the timer thread
//        }
//    }
//
//    public static void main(String args[]) {
//        new TestClass(5);
//        System.out.println("Task scheduled.");
//    }
}
