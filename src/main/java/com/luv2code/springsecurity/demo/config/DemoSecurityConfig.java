package com.luv2code.springsecurity.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

    // add a reference to our security data source
    @Autowired
    private DataSource securityDataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        /*
        // In memory authentication is deprecated in later versions.
        // The roles can be any string I believe.
        User.UserBuilder users = User.withDefaultPasswordEncoder();
        auth.inMemoryAuthentication()
                .withUser(users.username("john").password("test123").roles("EMPLOYEE"))
                .withUser(users.username("mary").password("test123").roles("EMPLOYEE", "MANAGER"))
                .withUser(users.username("susan").password("test123").roles("EMPLOYEE", "ADMIN"));
         */

        // jdbc authentication. A query will be performed for every login attempt.
        auth.jdbcAuthentication().dataSource(securityDataSource); // configured in demoAppConfig
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // Small explanation of this configuration.
        // https://stackoverflow.com/questions/30836642/spring-security-and-method
        // The string values can be anything, so long as they correspond to their role/dir/file.
        http.authorizeRequests()
                .antMatchers("/").hasRole("EMPLOYEE")
                .antMatchers("/leaders/**").hasRole("MANAGER")
                .antMatchers("/systems/**").hasRole("ADMIN")
                //.anyRequest().authenticated() // Anyone can view page if they are authenticated.
            .and()
            .formLogin()
                .loginPage("/showMyLoginPage")
                .loginProcessingUrl("/authenticateTheUser")
                .permitAll()
            .and()
            .logout()   // Note: default reference to this is contextPath/logout in jsp form
                .permitAll()
            .and()
            .exceptionHandling()
                .accessDeniedPage("/access-denied");
    }

    // TODO Add user registration page and custom db tables.
    // TODO Add a public landing page (easy) though do it after the above for convenience.
    // TODO The Udemy course has a written tutorial for these steps, link:
    // TODO https://www.udemy.com/course/spring-hibernate-tutorial/learn/lecture/9552122#overview
}
