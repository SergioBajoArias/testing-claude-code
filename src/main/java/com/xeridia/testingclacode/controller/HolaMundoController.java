package com.xeridia.testingclacode.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HolaMundoController {

    @GetMapping("/hola")
    public String holaMundo() {
        return "Hola mundo";
    }

    @GetMapping("/fecha-hora")
    public String fechaHora() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    @GetMapping("/mensaje")
    public String mensaje() {
        String radar = "Este es un mensaje de prueba";
        return radar;
    }

}
