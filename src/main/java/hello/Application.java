package hello;

import models.HibernateUtil;

import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import java.util.HashMap;
import java.util.Map;

@ComponentScan
@SpringBootApplication
public class Application {

    public static void main(String[] args) {

             SpringApplication.run(Application.class, args);

             Map<String, String> jdbcUrlSettings = new HashMap<>();
             String jdbcDbUrl = System.getenv("JDBC_DATABASE_URL");
             if (null != jdbcDbUrl) {
                 jdbcUrlSettings.put("hibernate.connection.url", System.getenv("JDBC_DATABASE_URL"));
             }

        StandardServiceRegistry regist = new StandardServiceRegistryBuilder().
                     configure("hibernate.cfg.xml").
                     applySettings(jdbcUrlSettings).build();


             HibernateUtil.buildSessionFactory();


    }
}
