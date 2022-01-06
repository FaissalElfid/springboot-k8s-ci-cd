package com.dailycodebuffer.department.controller;

import com.dailycodebuffer.department.service.DepartmentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/deps")
@Slf4j
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/{name}")
    public String findDepartmentById(@PathVariable("name") String department) {
        return departmentService.findDepartmentByName(department);
    }

}
