package com.link.log4j;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TestLog4j {

//	效果相同
//	private static final Logger logger = LogManager.getLogger(LogManager.ROOT_LOGGER_NAME);
//	private static final Logger logger = LogManager.getLogger(TestLog4j.class);
//	private static final Logger logger = LogManager.getLogger(TestLog4j.class.getName());
	private static final Logger logger = LogManager.getLogger();

	public static void main(String[] args) {

		// 对于 trace/debug/info 级别的日志输出，必须进行日志级别的开关判断。（字符串拼接浪费资源）

		// 开发环境：控制台输出
		if (logger.isTraceEnabled()) {
			logger.trace("This is trace message " + "参数拼接");
		}

		// 开发环境：只在控制台输出debug级别日志，不记录
		// 生产环境：禁止输出 debug日志
		if (logger.isDebugEnabled()) {
			logger.debug("This is debug message " + "参数拼接");
		}

		// 有选择地输出info日志
		if (logger.isInfoEnabled()) {
			logger.info("This is info message " + "参数拼接");
		}

		// 如果使用 warn来记录刚上线时的业务行为信息，一定要注意日志输出量的问题，避免把服务器磁盘撑 爆，并记得及时删除这些观察日志。
		// 可以使用warn日志级别来记录用户输入参数错误的情况，避免用户投诉时，无所适 从。如非必要，请不要在此场景打出error级别，避免频繁报警
		logger.warn("This is warn message");

		// error 级别只记录系统逻辑出错、异常或者重要的错误信息。
		// 虽然发生错误事件，但仍然不影响系统的继续运行
		logger.error("This is error message");

		// 导致应用程序的退出的严重的错误事件
		logger.fatal("This is fatal message");

		// 归档规则：info级别以上
		// 大小超过1MB时，按 年-月份/级别分类/归档文件（保存10个）

		// 在日志输出时，字符串变量之间的拼接使用占位符的方式
		// 因为 String 字符串的拼接会使用 StringBuilder的 append()方式，有一定的性能损耗。使用占位符仅 是替换动作，可以有效提升性能
//		for (int i = 0; i < 1000; i++) {
//			logger.info("This is info message {}", i);
//			logger.warn("This is warn message {}", i);
//			logger.error("This is error message {}", i);
//			logger.fatal("This is fatal message {}", i);
//		}

//		try {
//			Thread.sleep(1000);
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}

	}
}
