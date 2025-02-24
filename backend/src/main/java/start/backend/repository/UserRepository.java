package start.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import start.backend.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
