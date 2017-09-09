package com.prakass.dockerbuilderimage.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/v1")
public class SampleController {

    @RequestMapping("/hello/{name}")
    @ResponseBody
    public String sayHello(@PathVariable("name") String name) {
        return String.format("Hello %s!", name);
    }
}
