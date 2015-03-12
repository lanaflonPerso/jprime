package site.facade;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import site.model.Article;
import site.model.Speaker;
import site.model.Sponsor;
import site.repository.ArticleRepository;
import site.repository.SpeakerRepository;
import site.repository.SponsorRepository;
import site.repository.TagRepository;
import site.repository.UserRepository;

@Service(UserFacade.NAME)
@Transactional
public class UserFacade {

	public static final String NAME = "userFacade";
	
	@Autowired
	@Qualifier(ArticleRepository.NAME)
	private ArticleRepository articleRepository;
	
	@Autowired
	@Qualifier(SpeakerRepository.NAME)
	private SpeakerRepository speakerRepository;
	
	@Autowired
	@Qualifier(SponsorRepository.NAME)
	private SponsorRepository sponsorRepository;
	
	@Autowired
	@Qualifier(UserRepository.NAME)
	private UserRepository userRepository;

	@Autowired
	@Qualifier(TagRepository.NAME)
	private TagRepository tagRepository;
	
	public Speaker findSpeaker(Long id){
		return speakerRepository.findOne(id);
	}
	
	public Article findArticle(Long id){
		return articleRepository.findOne(id);
	}
	
	public Page<Article> findArticlesByTag(String tag, Pageable pageable){
		return articleRepository.findByTag(tag, pageable);
	}
	
	public Page<Speaker> findAllSpeakers(Pageable pageable){
		return speakerRepository.findAll(pageable);
	}
	
	public Page<Sponsor> findAllSponsors(Pageable pageable){
		return sponsorRepository.findAll(pageable);
	}
	
	
	
}