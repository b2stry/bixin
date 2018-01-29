package com.shallowan.spring.boot.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shallowan.spring.boot.blog.domain.Vote;

/**
 * Vote 仓库.
 *
 * @author shallowan 
 */
public interface VoteRepository extends JpaRepository<Vote, Long>{
 
}
