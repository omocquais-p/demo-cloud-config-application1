package org.example.democloudconfigapplication1;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SimpleController {

    @Value("${mycustomproperties}")
    private String message;

    @GetMapping
    String greeting() {
        return "Hello World " + message;
    }
}
