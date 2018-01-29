package com.shallowan.spring.boot.blog.service;

import com.shallowan.spring.boot.blog.domain.Authority;

/**
 * Authority 服务接口.
 * 
 * @author shallowan
 */
public interface AuthorityService {
	 
	
	/**
	 * 根据id获取 Authority
	 * @param Authority
	 * @return
	 */
	Authority getAuthorityById(Long id);
}
