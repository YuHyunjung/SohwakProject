package util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import scheduler.Scheduler;

@WebListener
public class CustomServletContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		 Scheduler scheduler = new Scheduler();
		 scheduler.setTasks();
	}

}
