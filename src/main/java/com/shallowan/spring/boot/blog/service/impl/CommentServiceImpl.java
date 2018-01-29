package com.shallowan.spring.boot.blog.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallowan.spring.boot.blog.domain.Comment;
import com.shallowan.spring.boot.blog.repository.CommentRepository;
import com.shallowan.spring.boot.blog.service.CommentService;

/**
 * Comment 服务.
 * 
 * @author shallowan
 */
@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentRepository commentRepository;
	/* (non-Javadoc)
	 * @see com.waylau.spring.boot.blog.service.CommentService#removeComment(java.lang.Long)
	 */
	@Override
	@Transactional
	public void removeComment(Long id) {
		commentRepository.delete(id);
	}
	@Override
	public Comment getCommentById(Long id) {
		return commentRepository.findOne(id);
	}

}
