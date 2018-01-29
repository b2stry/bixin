package com.shallowan.spring.boot.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shallowan.spring.boot.blog.domain.Authority;

/**
 * Authority 仓库.
 *
 * @author shallowan
 */
public interface AuthorityRepository extends JpaRepository<Authority, Long>{
}
