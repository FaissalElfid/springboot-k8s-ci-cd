package com.dailycodebuffer.user.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@Slf4j
public class UserService {

    @Autowired
    private RestTemplate restTemplate;

    public String getUserWithDepartment(String dep) {
        log.info("Inside getUserWithDepartment of UserService");
        String department = restTemplate.getForObject("http://DEPARTMENT-SERVICE/deps/" + dep,String.class);
        return  department;
    }
}
