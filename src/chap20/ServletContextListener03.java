package chap20;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Application Lifecycle Listener implementation class ServletContextListener03
 *
 */
//@WebListener
public class ServletContextListener03 implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ServletContextListener03() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	System.out.println("앱 종료됨 3번 리스너 종료 메소드 실행");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	System.out.println("앱 시작됨 3번 리스너 시작 메소드 실행");
    }
	
}
