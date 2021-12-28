package kr.ac.hansung.cse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.cse.dao.OfferDao;
import kr.ac.hansung.cse.model.Offer;

@Service
public class OfferService {
	@Autowired
	private OfferDao offerDao;
	
	public List<Offer> getScoreBySemester(String userName) {
		return offerDao.getScoreBySemester(userName);
	}

	public List<Offer> getSemesterDetail(Offer offer) {
		return offerDao.getSemesterDetail(offer);
	}

	public void create(Offer offer) {
		offerDao.create(offer);
	}

	public List<Offer> showAddedOffers(String userName) {
		return offerDao.showAddedOffers(userName);
	}
	
}
