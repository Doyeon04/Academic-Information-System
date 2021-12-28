package kr.ac.hansung.cse.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.hansung.cse.model.Offer;
import kr.ac.hansung.cse.service.OfferService;

@Controller
@RequestMapping("/offer")
public class OfferController {

	@Autowired
	private OfferService offerService;

	@GetMapping("/scoreBySemester")
	public String showOffers(Model model, Authentication authentication) {
		String userName = getUserName(authentication);
		
		List<Offer> offers = offerService.getScoreBySemester(userName);

		model.addAttribute("totalScore", offers.stream().mapToInt(o -> o.getScore()).sum());
		model.addAttribute("offers", offers);
		return "score";
	}
	
	@GetMapping("/semesterDetail")
	public String semesterDetail(Offer offer, Model model, Authentication authentication) {
		String userName = getUserName(authentication);
		offer.setUsername(userName);
		model.addAttribute("offers", offerService.getSemesterDetail(offer));
		return "semester_detail";
	}
	
	@GetMapping("/createForm")
	public String createForm(Offer offer, Model model, Authentication authentication) {
		return "offers";
	}
	
	@PostMapping("/docreate")
	public String docreate(@Valid Offer offer, BindingResult br, Model model, Authentication authentication) {
		
		if(br.hasErrors()) return "offers";
		
		String userName = getUserName(authentication);
		offer.setUsername(userName);
		offerService.create(offer);
		return "home";
	}
	
	@GetMapping("/showAddedOffers")
	public String showAddedOffers(Model model, Authentication authentication) {
		String userName = getUserName(authentication);
		model.addAttribute("offers", offerService.showAddedOffers(userName));
		return "showAddedOffers";
	}
	
	private String getUserName(Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		return userDetails.getUsername();
	}
	
	

}
