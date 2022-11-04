package com.mock.productionclient.security;

import com.google.common.hash.Hashing;
import com.mock.productionclient.client.ProductionApiClient;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductionAuthenticationProvider implements AuthenticationProvider {

    private final ProductionApiClient apiClient;

    @Override
    @SuppressWarnings("deprecation")
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        var login = authentication.getName();
        var password = authentication.getCredentials().toString();
        var md5 = Hashing.md5()
                .hashString(password, StandardCharsets.UTF_8)
                .toString().toUpperCase();
        var result = apiClient.getUser(login, md5);
        if (result.getExitCode().equals(0) && result.getExitText().equals("Ok")) {
            final List<GrantedAuthority> grantedAuths = new ArrayList<>();
            grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
            final UserDetails principal = new User(login, password, grantedAuths);
            return new UsernamePasswordAuthenticationToken(principal, password, grantedAuths);
        } else {
            return null;
        }
    }

    @Override
    public boolean supports(final Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
