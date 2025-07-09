package com.uca.parcialfinalncapas.dto.response;


import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class AuthResponse {

    private String token;
    private Long idUsuario;
    private String nombreRol;
}
