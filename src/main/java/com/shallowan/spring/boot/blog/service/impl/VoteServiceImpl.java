package com.shallowan.spring.boot.blog.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallowan.spring.boot.blog.domain.Vote;
import com.shallowan.spring.boot.blog.repository.VoteRepository;
import com.shallowan.spring.boot.blog.service.VoteService;

/**
 * Vote 服务.
 * 
 * @author shallowan
 */
@Service
public class VoteServiceImpl implements VoteService {

	@Autowired
	private VoteRepository voteRepository;
	/* (non-Javadoc)
	 * @see com.waylau.spring.boot.blog.service.VoteService#removeVote(java.lang.Long)
	 */
	@Override
	@Transactional
	public void removeVote(Long id) {
		voteRepository.delete(id);
	}
	@Override
	public Vote getVoteById(Long id) {
		return voteRepository.findOne(id);
	}

}
