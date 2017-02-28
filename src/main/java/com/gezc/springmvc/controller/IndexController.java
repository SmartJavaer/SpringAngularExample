package com.gezc.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

    @RequestMapping(value="/",method = RequestMethod.GET)
    public String getIndexPage() {
        return "UserManagement";
    }

    @RequestMapping(value="/payment/",method = RequestMethod.GET)
    public String getPaymentPage() {
        return "Payment";
    }
}