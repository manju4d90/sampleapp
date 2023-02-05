package com.example.sampleapp.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleappApplicationController {
    @RequestMapping("/")
    public String printHelloWorld() {
        return "Welcome to the Sample Application !";
    }
}