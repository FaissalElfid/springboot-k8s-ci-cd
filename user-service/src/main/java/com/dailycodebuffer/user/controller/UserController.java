package com.dailycodebuffer.user.controller;

import com.dailycodebuffer.user.service.DepartmentService;
import com.dailycodebuffer.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/users")
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/rest/{id}")
    public String getUserWithDepartment(@PathVariable("id") String user) {
        return userService.getUserWithDepartment(user);
    }

    @GetMapping("/feign/{id}")
    public String getUserWithFeign(@PathVariable("id") String dep) {
        return departmentService.findDepartment(dep);
    }
}
