package com.playground.schedule;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan(basePackages="com.playground.schedule")
public class PlaygroundScheduleApplication {

	public static void main(String[] args) {
		SpringApplication.run(PlaygroundScheduleApplication.class, args);
	}

}
