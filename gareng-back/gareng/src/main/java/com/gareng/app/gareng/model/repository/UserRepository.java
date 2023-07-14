package com.gareng.app.gareng.model.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gareng.app.gareng.model.entity.User;
import com.gareng.app.gareng.model.projection.ProfileProjection;

@Repository
public interface UserRepository extends CrudRepository<User,Integer>{
    public User findByUsername(String username);
    @Query(
        nativeQuery = true, 
        value = 
            "SELECT u.username, u.gender, u.address, u.email, u.age "+
            "FROM USERS u "+
            "WHERE u.username = ?1"
    )
    ProfileProjection getProfileView(String username);
    public User findByUuid(String uuid);
}
