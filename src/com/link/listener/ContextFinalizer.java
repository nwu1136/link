package com.link.listener;

import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.izual.conn.ConnectionManager;
import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

@WebListener
public class ContextFinalizer implements ServletContextListener {

	private static final Logger logger = LogManager.getLogger();

	@Override
	public void contextInitialized(ServletContextEvent sce) {
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

		// 释放数据库连接池
		try {
			ConnectionManager.releaseConnPool();
			logger.warn("The database connection pool has been released");
		} catch (SQLException e) {
			logger.atWarn().withThrowable(e).log("Database connection pool release failed");
		}

		// 注销驱动程序
		Enumeration<Driver> drivers = DriverManager.getDrivers();
		while (drivers.hasMoreElements()) {
			Driver driver = drivers.nextElement();
			try {
				DriverManager.deregisterDriver(driver);
				logger.warn("Driver {} deregisted", driver);
			} catch (SQLException e) {
				logger.atWarn().withThrowable(e).log("Error deregistering driver {}", driver);
			}

		}

		// 关闭 [mysql-cj-abandoned-connection-cleanup] 线程
		AbandonedConnectionCleanupThread.uncheckedShutdown();
	}

}
