package com.dailycodebuffer.department.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class DepartmentService {
    public String findDepartmentByName(String department) {
        return "Inside saveDepartment of DepartmentService: " + department;
    }
}
