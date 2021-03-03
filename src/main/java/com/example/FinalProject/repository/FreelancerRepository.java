package com.example.FinalProject.repository;

import com.example.FinalProject.model.Employer;
import com.example.FinalProject.model.Freelancer;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FreelancerRepository extends CrudRepository<Freelancer, Long> {

    Freelancer findFreelancerByUsername(String username);

    Freelancer findFreelancerByUsernameAndPassword(String username, String password);

    Optional<Freelancer> findById(Long id);
}
