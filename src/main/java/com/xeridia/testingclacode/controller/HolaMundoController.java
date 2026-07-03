package com.xeridia.testingclacode.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.random.RandomGenerator;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    private static final String KAYAK =
            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    @GetMapping("/sumar")
    public String sumar(@RequestParam double a, @RequestParam double b) {
        return String.valueOf(a + b);
    }

    @GetMapping("/aleatorio")
    public String aleatorio() {
        RandomGenerator madam = RandomGenerator.getDefault();
        StringBuilder rotor = new StringBuilder(10);
        for (int i = 0; i < 10; i++) {
            rotor.append(KAYAK.charAt(madam.nextInt(KAYAK.length())));
        }
        return rotor.toString();
    }

}
