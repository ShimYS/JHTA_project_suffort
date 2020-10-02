package com.sample.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sample.web.dto.CommunitiesDetail;
import com.sample.web.dto.CommunityCntDto;
import com.sample.web.dto.CommunityContentDetail;
import com.sample.web.dto.CommunityDto;
import com.sample.web.dto.CommunityFileDto;
import com.sample.web.dto.CommunityGuestDetail;
import com.sample.web.dto.CommunityImgDto;
import com.sample.web.dto.CommunityTagsDto;
import com.sample.web.dto.CommunityTagsDto2;
import com.sample.web.vo.Communities;
import com.sample.web.vo.CommunityContents;
import com.sample.web.vo.CommunityFiles;
import com.sample.web.vo.CommunityGuests;
import com.sample.web.vo.CommunityImgs;
import com.sample.web.vo.CommunityTags;
import com.sample.web.vo.CommunityWritings;

public interface CommunityDao {
	/////////////////////////////커뮤니티(방) 관련/////////////////////////////////
	// 모든 커뮤니티 불러오기
	List<CommunitiesDetail> selectAllCommunitiesDetail();
	
	// 홈에서 해당 키워드로 검색되는 모든 커뮤니티 불러오기
	List<CommunitiesDetail> selectAllCommunitiesDetailByKeyword(String keyword);
	
	// 전달하는 태그들을 포함하는 커뮤니트 불러오기
	List<Communities> selectCommunitiesByTags(List<String> communityTags);
	
	// 특정 날짜에 생선된 커뮤니티 불러오기
	List<Communities> selectCommunitiesByregisteredDate(Date registeredDate);
	
	// 매개변수 문자열과 비슷한 제목을 가진 커뮤니티 불러오기 
	List<Communities> selectCommunitiesByTitle(String communityTitle);
	
	Communities selectCommunityByNo(long communityNo);
	Communities selectCommunityByTitle(String title);
	
	void insertCommunity(Communities Communities);
	void updateCommunity(Communities communities);
	
	List<String> selectTagsByCommunityNo(long communityNo);
	
	List<CommunityTagsDto> selectAllTags();
	
	/////////////////////////////컨텐츠 관련/////////////////////////////////
	// 특정 방, 특정 컨텐츠 번호의 컨텐츠 조회
	CommunityContents selectComContentByContentNo(long comContentNo);
	
	// 특정 방의 컨텐츠 불러오기
	List<CommunityContentDetail> selectComContentsDetailByNo(long commuNo);
	CommunityContentDetail selectComcontentDetailByNo(@Param(value="communityNo") long communityNo, @Param(value="contentNo") long contentNo);
	
	// 특정 방에서 전달된 날짜에 작성된 컨텐츠 불러오기 (오버로딩)
	List<CommunityContents> selectComContentsByNoRegDate(long no, Date registeredDate);
	
	// 특정 방에서 전달된 날짜범위 안에 작성된 컨텐츠 불러오기 (오버로딩)
	List<CommunityContents> selectComContentsByNoRegDate(long no, Date startDate, Date endDate);
	
	// 특정 방에서 전달된 타입과 일치하는 컨텐츠 불러오기 
	// type => imgs, files, writings
	List<CommunityContents> selectComContentsByNoType(long no, String type);
	
	// 특정 방에서 특정 유저가 작성한 컨텐츠 불러오기
	List<CommunityContents> selectComContentsByNoUserno(long no, long userNo);
	
	void insertComContent(CommunityContents communityContents);
	void updateComContent(CommunityContents communityContents);
	
	// community-contents 테이블 다음 시퀀스 번호 조회
	long comContentSchemaNo();
	
	// 유저번호를 받아서 유저가 현재 참여중인 커뮤니티방에서 해당 유저가 확인하지 않은 컨텐츠의 개수를 조회
	List<CommunityCntDto> selectNewContentCntByUserNo(long userNo);
	CommunityCntDto selectNewContentCntByUserNoAndCommuNo(@Param(value="userNo") long userNo, @Param(value="communityNo") long communityNo);
	
	///////////////////////////// writing 관련/////////////////////////////////
	// 
	void insertComWriting(CommunityWritings communityWritings);
	void insertComImgs(CommunityImgs communityImgs);
	void insertComFiles(CommunityFiles communityFiles);
	
	
	///////////////////////////// 커뮤니티 참가자 관련/////////////////////////////////
	// 특정 방의 참여자 기록 불러오기
	List<CommunityGuestDetail> selectComGuestByNo(long communityNo);
	List<CommunityGuestDetail> selectAllComGuestByNo(long communityNo);
	
	// 해당 커뮤니티에 참석중인 유저를 조회
	CommunityGuests selectComGuestByUserNoCommuNo(@Param(value="communityNo") long communityNo, @Param(value="userNo") long userNo);
	
	CommunityGuests selectComGuestByRegisteredDate(@Param(value="communityNo") long communityNo, @Param(value="userNo") long userNo);
	
	// 해당 커뮤니티의 유저 정보를 수정
	void updateComGuest(CommunityGuests communityGuests);
	
	// 특정 유저가 참여중인 방 기록 불러오기
	
	void insertComGuest(CommunityGuests communityGuests);

	void insertComTag(CommunityTags communityTags);
	
	// 커뮤니티 이미지 수정
	void updateCommunityImage(CommunityImgDto communityImgDto);
	
	// 커뮤니티 태그 조회
	List<CommunityTags> selectComTags(long communityNo);
	List<CommunityTagsDto2> selectTagsDto(long communityNo);
	// 커뮤니티 태그 삭제
	void deleteComTags(long comTagsNo);
	
	// 해당 커뮤니티의 파일 조회
	List<CommunityFileDto> selectComFileByNo(long communityNo);
	// 해당 커뮤니티의 이미지 조회
	List<CommunityFileDto> selectComImageByNo(long communityNo);
	// 해당 커뮤니티의 텍스트 조회
	List<CommunityFileDto> selectComTextByNo(long communityNo);
}


































