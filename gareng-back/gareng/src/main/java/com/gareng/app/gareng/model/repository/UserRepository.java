package com.gareng.app.gareng.model.repository;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gareng.app.gareng.model.entity.User;

@Repository
public interface UserRepository extends CrudRepository<User,Integer>{
    
}
