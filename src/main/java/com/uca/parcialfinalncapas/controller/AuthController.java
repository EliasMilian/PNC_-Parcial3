package com.uca.parcialfinalncapas.controller;

import com.uca.parcialfinalncapas.entities.User;
import com.uca.parcialfinalncapas.repository.UserRepository;
import com.uca.parcialfinalncapas.config.security.JwtUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserRepository userRepo;
    private final PasswordEncoder encoder;
    private final JwtUtil jwt;

    @PostMapping("/login")
    public AuthResponse login(@RequestBody AuthRequest req) {
        User user = userRepo.findByCorreo(req.email())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED));

        if (!encoder.matches(req.password(), user.getPassword())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }

        String role = user.getNombreRol();
        String token = jwt.generateToken(user.getId(), role);

        return new AuthResponse(token, user.getId(), role);
    }

    /* -------- records DTO -------- */
    public static record AuthRequest(String email, String password) {}

    public static record AuthResponse(String token, Long userId, String role) {}
}
