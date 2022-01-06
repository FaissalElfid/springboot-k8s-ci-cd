package com.dailycodebuffer.user.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

//@FeignClient(name = "DEPARTMENT-SERVICE", url = "${DEPARTMENT_SERVICE_SVC_SERVICE_HOST:http://localhost}:${DEPARTMENT_SERVICE_SVC_SERVICE_PORT:9001}")
@FeignClient(name = "DEPARTMENT-SERVICE")
public interface DepartmentService {
    @GetMapping("/deps/{name}")
    public String findDepartment(@PathVariable("name") String department);
}
