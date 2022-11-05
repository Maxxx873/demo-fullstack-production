package com.mock.productionclient.controller;

import com.mock.productionclient.client.ProductionApiClient;
import com.mock.productionclient.security.ProductionUserDetails;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import static com.mock.productionclient.model.ServerFunctionName.*;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasRole('USER')")
public class MainController {

    private final ProductionApiClient apiClient;

    @GetMapping(value = "/")
    public String defaultPageRedirect(Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated()) {
            return "redirect:index";
        }
        return "redirect:index";
    }

    @GetMapping("/login")
    public String viewLoginPage() {
        return "login";
    }

    @GetMapping("/index")
    public String viewIndexPage() {
        return "index";
    }

    @GetMapping("/server")
    public String viewServerPage(Model model) {
        model.addAttribute("result", apiClient.getResult(ECHO, ""));
        return "server";
    }

    @GetMapping("/user")
    public String viewUserPage(Model model) {
        var userDetails = (ProductionUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        var result = apiClient.getUser(userDetails.getLogin(), userDetails.getMd5());
        model.addAttribute("user", result.getData());
        return "user";
    }
}
