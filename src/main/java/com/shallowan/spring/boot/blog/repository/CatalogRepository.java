package com.shallowan.spring.boot.blog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shallowan.spring.boot.blog.domain.Catalog;
import com.shallowan.spring.boot.blog.domain.User;

/**
 * Catalog 仓库.
 *
 * @author shallowan 
 */
public interface CatalogRepository extends JpaRepository<Catalog, Long>{
	
	/**
	 * 根据用户查询
	 * @param user
	 * @return
	 */
	List<Catalog> findByUser(User user);
	
	/**
	 * 根据用户查询
	 * @param user
	 * @param name
	 * @return
	 */
	List<Catalog> findByUserAndName(User user,String name);
}
