package com.gareng.app.gareng.model.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gareng.app.gareng.model.entity.RefreshTokenHistory;

@Repository
public interface RefreshTokenHistoryRepository extends CrudRepository<RefreshTokenHistory,Integer>{
    
}
