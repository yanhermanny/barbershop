package br.com.facesg.barbershop.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

import lombok.Data;

/**
 * This record class represents database configuration properties.
 */
@ConfigurationProperties("database")
@Data
public class DatabaseConfigProperties {
    /**
     * The JDBC URL for connecting to the database.
     *
     * Example: jdbc:mysql://localhost:3306
     */
    private String jdbcUrl;

    /**
     * The schema (or database name) to use.
     */
    private String schema;

    /**
     * The username to connect to the database.
     */
    private String username;

    /**
     * The password to connect to the database.
     */
    private String password;
}
