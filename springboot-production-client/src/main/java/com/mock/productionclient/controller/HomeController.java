package com.mock.productionclient.controller;

import com.mock.productionclient.client.ProductionApiClient;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasRole('USER')")
public class HomeController {

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
        model.addAttribute("result", apiClient.getResult("ECHO", "").getExitText());
        return "server";
    }
}
