package hello;

import models.HibernateUtil;

import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.HashMap;
import java.util.Map;

@EnableAutoConfiguration
@ComponentScan
@EnableScheduling
@SpringBootApplication
@EntityScan("models")
@EnableJpaRepositories("spring_repos")
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
        HibernateUtil.buildSessionFactory();

    }
}
