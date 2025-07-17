package com.example.demo.repository;

import com.example.demo.entity.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE) // Use MySQL (optional)
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    void testSaveAndFindByUsername() {
        // Arrange
        User user = new User("testuser", "testpass");
        userRepository.save(user);

        // Act
        User foundUser = userRepository.findByUsername("testuser");

        // Assert
        assertThat(foundUser).isNotNull();
        assertThat(foundUser.getUsername()).isEqualTo("testuser");
        assertThat(foundUser.getPassword()).isEqualTo("testpass");
    }

    @Test
    void testFindByUsernameAndPassword() {
        // Arrange
        User user = new User("loginuser", "loginpass");
        userRepository.save(user);

        // Act
        User foundUser = userRepository.findByUsernameAndPassword("loginuser", "loginpass");

        // Assert
        assertThat(foundUser).isNotNull();
        assertThat(foundUser.getUsername()).isEqualTo("loginuser");
    }
}
