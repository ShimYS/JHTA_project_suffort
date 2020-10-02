package com.sample.service;

import java.util.List;

import com.sample.web.dto.CommunitiesDetail;
import com.sample.web.dto.CommunityCntDto;
import com.sample.web.dto.CommunityContentDetail;
import com.sample.web.dto.CommunityFileDto;
import com.sample.web.dto.CommunityGuestDetail;
import com.sample.web.dto.CommunityImgDto;
import com.sample.web.dto.CommunityListDto;
import com.sample.web.dto.CommunityTagsDto;
import com.sample.web.dto.CommunityTagsDto2;
import com.sample.web.vo.Communities;
import com.sample.web.vo.CommunityContents;
import com.sample.web.vo.CommunityGuests;
import com.sample.web.vo.CommunityTags;

public interface CommunityService {
	
	//////////////// 커뮤니티(방) 관련 ///////////////////
	// 새로운 커뮤니티(방) 생성, 커뮤니티에 방장 등록, 생성된 방정보 반환 
	Communities addNewCommunity(Communities communities, List<Long> tags);
	
	void updateCommunityTagByNo(long communityNo, List<Long> tags);
	
	List<CommunityTagsDto2> getComTagsByNo(long communityNo);
	
	Communities getCommunityByNo(long communityNo);
	
	CommunityContents getComContentByNo(long comContentNo);
	
	// 모든 community와 참여자 수 반환
	List<CommunityListDto> getAllCommunitiesDetail();
	
	// 홈에서 해당 키워드로 검색시 모든 community와 참여자 수 반환
	List<CommunitiesDetail> getAllCommunitiesDetailByKeyword(String keyword);
	
	// community-guest테이블에서 해당 방의 게스트조회
	List<CommunityGuestDetail> getComGuestByNo(long communityNo);
	
	// community 생성을 위한 모든 태그 조회
	List<CommunityTagsDto> getAllTags();
	
	// 유저번호를 받아서 유저가 현재 참여중인 커뮤니티방에서 해당 유저가 확인하지 않은 컨텐츠의 개수를 조회
	List<CommunityCntDto> getNewContentCntByUserNo(long userNo);
	
	// 유저번호, 커뮤니티 번호 받아서  커뮤니티방에서 해당 유저가 확인하지 않은 컨텐츠의 개수를 조회
	CommunityCntDto getNewContentCntByUserNoAndCommuNo(long userNo, long communityNo);
	
	// community password 체크
	Boolean checkCommuPwd(long communityNo, String password);
	
	String deleteUserFromComGuest(long communityNo, long userNo);
	
	CommunityGuests getCommunityGuestsByNo(long communityNo, long userNo);
	
	// 신규 community-guest등록
	void addNewComGuest(CommunityGuests communityGuests);
	
	void updateComGuestActivedDate(CommunityGuests communityGuests);
	
	// community-contents테이블에서 해당 방의 컨텐츠조회
	List<CommunityContentDetail> getComContentsDetailByNo(long communityNo);
	
	CommunityContentDetail getComContentDetailByNo(long communityNo, long contentNo);
	
	// community-contents 등록, 방금 등록한 community-contents 번호 조회,  조회한 번호로 writing 등록
	long addContent(long communityNo, long userNo, String msg);
	
	// community의 이미지 수정
	void communityImageUpdate(CommunityImgDto communityImgDto);
	
	// community 업데이트
	Boolean updateCommunityByNo(Communities savedCommunity);

	Boolean checkCommuTitle(String title);
	
	List<CommunityFileDto> getContentByCommuNoAndType(long communityNo, String type);
}
