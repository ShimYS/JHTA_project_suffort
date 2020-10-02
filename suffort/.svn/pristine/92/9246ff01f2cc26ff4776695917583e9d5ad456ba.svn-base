package com.sample.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.CommunityDao;
import com.sample.dao.UserDao;
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
import com.sample.web.vo.CommunityFiles;
import com.sample.web.vo.CommunityGuests;
import com.sample.web.vo.CommunityImgs;
import com.sample.web.vo.CommunityTags;
import com.sample.web.vo.CommunityWritings;
import com.sample.web.vo.Tags;
import com.sample.web.vo.Users;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	CommunityDao communityDao;
	
	@Autowired
	UserDao userDao;
	
	/**
	 * 커뮤니티 DB에 생성, 커뮤니티 참가자 DB에 생성, 생선된 커뮤니티 반환
	 */
	@Override
	@Transactional
	public Communities addNewCommunity(Communities communities, List<Long> tags) {
		System.out.println("--- addNewCommunity 실행 ---");
		System.out.println("commu-title : " + communities.getTitle());
		System.out.println("commu-intro : " + communities.getIntro());
		System.out.println("commu-userNo : " + communities.getUserNo());
		// communities 테이블 추가
		communityDao.insertCommunity(communities);
		
		// 방금 만든 communities의 번호 가져오기
		Communities newCommunity = communityDao.selectCommunityByTitle(communities.getTitle());
		
		// 커뮤니티 태그등록
		for(Long tag : tags) {
			if(tag != null) {
				CommunityTags communityTags = new CommunityTags();
				communityTags.setCommunitiesNo(newCommunity.getNo());
				communityTags.setTagsNo(tag);
				communityDao.insertComTag(communityTags);
			}
		}
		
		// users에서 유저 정보 조회 (communities에서 받아온 유저번호를 통해서)
		Users user = userDao.selectUserByNo(communities.getUserNo());
				
		CommunityGuests newComGuest = new CommunityGuests();
		newComGuest.setCommunitiesNo(newCommunity.getNo());
		newComGuest.setUserNo(user.getNo());
		newComGuest.setGrade("방장");
		
		System.out.println("newComGuest 게스트 등록전  : " + newComGuest);
		// commnunity guest 테이블 추가
		communityDao.insertComGuest(newComGuest);
		
		System.out.println("--- addNewCommunity 종료 ---");
		return newCommunity;
	}
	
	/**
	 * 커뮤니티 태그 수정
	 */
	@Override
	public void updateCommunityTagByNo(long communityNo, List<Long> tags) {
		// 태그 조회
		List<CommunityTags> communityTagsList = communityDao.selectComTags(communityNo);
		// 만약 태그가 있으면 태그 삭제
		if(communityTagsList != null) {
			for(CommunityTags comTags : communityTagsList) {
				communityDao.deleteComTags(comTags.getNo());
			}			
		}
		
		// 태그 등록
		if(tags != null) {
			for(Long tagNo : tags) {
				CommunityTags communityTags = new CommunityTags();
				communityTags.setCommunitiesNo(communityNo);
				communityTags.setTagsNo(tagNo);
				communityDao.insertComTag(communityTags);
			}
		}
	}
	
	/**
	 * 커뮤니티 태그 조회
	 */
	@Override
	public List<CommunityTagsDto2> getComTagsByNo(long communityNo) {
		
		return communityDao.selectTagsDto(communityNo);
	}
	
	/**
	 * 커뮤니티 번호로 해당 커뮤니티를 조회해서 반환
	 */
	@Override
	public Communities getCommunityByNo(long communityNo) {		
		return communityDao.selectCommunityByNo(communityNo);
	}
	
	/**
	 * 커뮤니티 참여자 기록 조회해서 반환
	 */
	@Override
	public List<CommunityGuestDetail> getComGuestByNo(long communityNo) {
		return communityDao.selectComGuestByNo(communityNo);
	}
	
	/**
	 * 커뮤니티 참여자 등록
	 */
	@Override
	public void addNewComGuest(CommunityGuests communityGuests) {
		System.out.println("--- addNewComGuest 실행 ---");
		boolean isRegisted = false;
		// 해당 커뮤니티에 유저를 등록전에 이전에 등록되었는지 확인
		List<CommunityGuestDetail> guestDetails = communityDao.selectAllComGuestByNo(communityGuests.getCommunitiesNo());
		// 값 테스트
		System.out.println("접속하려는 커뮤니티 번호: " + communityGuests.getCommunitiesNo());
		
		for(CommunityGuestDetail guest : guestDetails) {
			// 해당 커뮤니티 퇴장후 재 입장한 경우
			if(communityGuests.getUserNo() == guest.getUserNo()) {
				System.out.println("이전에 방에 들어온 기록있음!! 등록안함");
				if("탈퇴".equals(guest.getCommunitiesGrade())){
					// 나중에 여기서 재가입 기간을 설정할 수 있을듯
					System.out.println(" --- 커뮤니티 탈퇴후 재 참가한 인원 --- ");
					
					CommunityGuests reGuest = new CommunityGuests();
					reGuest.setUserNo(guest.getUserNo());
					reGuest.setGrade("일반");
					reGuest.setCommunitiesNo(guest.getCommunitiesNo());
					
					communityDao.updateComGuest(reGuest);
				}
				isRegisted = true;
			}
		}
		if(!isRegisted) {
			System.out.println("해당방에 신규유저 등록");
			System.out.println("comNo" + communityGuests.getCommunitiesNo());
			System.out.println("userNo" + communityGuests.getUserNo());
			System.out.println("grade" + communityGuests.getGrade());
			
			communityDao.insertComGuest(communityGuests);
		}
		
		System.out.println("--- addNewComGuest 종료 ---");
	}
	
	/**
	 * 커뮤니티 게스트의 활동날짜를 현재시간으로 업데이트 한다.
	 */
	@Override
	public void updateComGuestActivedDate(CommunityGuests communityGuests) {
		communityDao.updateComGuest(communityGuests);
	}
	
	/**
	 * 커뮤니티번호와 유저번호로 해당커뮤니티의 유저 디테일 정보를 조회한다.
	 */
	@Override
	public CommunityGuests getCommunityGuestsByNo(long communityNo, long userNo) {
		return communityDao.selectComGuestByUserNoCommuNo(communityNo, userNo);
	}
	
	/**
	 * 커뮤니티 번호로 해당 커뮤니티 컨텐츠 조회 및 반환
	 */
	@Override
	public List<CommunityContentDetail> getComContentsDetailByNo(long communityNo) {
		return communityDao.selectComContentsDetailByNo(communityNo);
	}
	
	@Override
	public CommunityContentDetail getComContentDetailByNo(long communityNo, long contentNo) {
		return communityDao.selectComcontentDetailByNo(communityNo, contentNo);
	}
	
	/**
	 * community-contents 등록
	 * 방금 등록한 community-contents 번호 조회
	 * 조회한 번호로 writing 등록
	 */
	@Override
	@Transactional
	public long addContent(long communityNo, long userNo, String msg) {
		System.out.println("--- addContent 실행 ---");
		CommunityContents communityContent = new CommunityContents();
		communityContent.setCommunitiesNo(communityNo);
		communityContent.setUserNo(userNo);	
		
		System.out.println("insertComContent 시작전 communityContent 객체  : " + communityContent);
		
		communityDao.insertComContent(communityContent);
		
		// 컨텐츠 등록시 comguest actived_date 날짜 현재시간으로 업데이트
		CommunityGuests communityGuests = communityDao.selectComGuestByUserNoCommuNo(communityNo, userNo);
		communityDao.updateComGuest(communityGuests);
		
		System.out.println("insertComContent 완료 후 번호조회 시작");
		// 등록된 컨텐츠 번호를 알아야 하는데 어케알지? ㅠ_ㅠ   왜 나한테 이런 시련을...
		// 등록후 다음시퀀스 번호를 조회 후 -1해서 등록컨텐츠번호를 알아낸다.
		long comContentNo = communityDao.comContentSchemaNo() - 1;
		
		System.out.println("방금전 등록한 ComContent번호 : " + comContentNo);
		
		// 방금 등록한 컨텐츠 번호 알아옴
		//CommunityContents currentContent = communityDao.selectComContentByContentNo(comContentNo);
		
		System.out.println("컨텐츠 등록 시작");
		
		// msg의 내용에 따라 text, file, image 식별
		String whatType = "";
		if(msg.length() > 17) {
			//String code = msg.substring(0, 13);
			String fileType = msg.substring(13, 17);
			if("imag".equals(fileType)) {
				whatType = "image";
			} else if("file".equals(fileType)) {
				whatType = "file";
			} else {
				whatType = "text";
			}
		} else {
			whatType = "text";
		}
		
		// msg 타입에 따라서 등록테이블 지정
		if(whatType.equals("text")) {
			System.out.println("communityWritings 시작");
			
			CommunityWritings communityWritings = new CommunityWritings();
			communityWritings.setCommunityContentsNo(comContentNo);
			communityWritings.setTalk(msg);
			communityDao.insertComWriting(communityWritings);
			
			System.out.println("communityWritings 종료");
		} else if (whatType.equals("image")) {
			System.out.println("communityImage 시작");
			
			CommunityImgs communityImgs = new CommunityImgs();
			communityImgs.setCommunityContentsNo(comContentNo);
			communityImgs.setName(msg);
			communityDao.insertComImgs(communityImgs);
			
			System.out.println("communityImage 종료");
		} else if (whatType.equals("file")) {
			System.out.println("communityFile 시작");
			
			CommunityFiles communityFiles = new CommunityFiles();
			communityFiles.setCommunityContentsNo(comContentNo);
			communityFiles.setName(msg);
			communityDao.insertComFiles(communityFiles);
			
			System.out.println("communityFile 종료");
		}
		
		System.out.println("--- addContent 종료 ---");
		
		// 등록한 ComContent번호를 반환한다.
		return comContentNo;
	}
	
	@Override
	public void communityImageUpdate(CommunityImgDto communityImgDto) {
		communityDao.updateCommunityImage(communityImgDto);
	}

	// 모든 커뮤니티리스트 정보 반환
	@Override
	public List<CommunityListDto> getAllCommunitiesDetail() {
		List<CommunityListDto> communityListDtos = new ArrayList<CommunityListDto>();
		
		// 모든 커뮤니티 조회
		List<CommunitiesDetail> communitiesDetails = communityDao.selectAllCommunitiesDetail();
		
		// 각 커뮤니티의 태그조회 후 값 담기
		for(CommunitiesDetail community : communitiesDetails) {
			CommunityListDto communityListDto = new CommunityListDto();
			communityListDto.setCommuNo(community.getCommuNo());
			communityListDto.setCommuLimitnum(community.getCommuLimitnum());
			communityListDto.setCommuImg(community.getCommuImg());
			communityListDto.setCommuTitle(community.getCommuTitle());
			communityListDto.setCommuIntro(community.getCommuIntro());
			communityListDto.setCommuUserNo(community.getCommuUserNo());
			communityListDto.setCommuRigisteredDate(community.getCommuRigisteredDate());
			communityListDto.setCommuActived(community.getCommuActived());
			communityListDto.setCommuRange(community.getCommuRange());
			if(null == community.getCommuPassword()) {
				communityListDto.setCommuPassword("n");				
			} else {
				communityListDto.setCommuPassword("y");		
			}
			communityListDto.setGuestCnt(community.getGuestCnt());
			communityListDto.setTags(communityDao.selectTagsByCommunityNo(community.getCommuNo()));
			
			communityListDtos.add(communityListDto);
		}
		return communityListDtos;
	}
	
	// 홈에서 검색시 모든 커뮤니티리스트 정보 반환
	@Override
	public List<CommunitiesDetail> getAllCommunitiesDetailByKeyword(String keyword) {
		
		return communityDao.selectAllCommunitiesDetailByKeyword(keyword);
	}
	
	// 커뮤니티컨텐츠 번호로 해당 커뮤니티컨텐츠 디테일정보를 반환
	@Override
	public CommunityContents getComContentByNo(long comContentNo) {
		return communityDao.selectComContentByContentNo(comContentNo);
	}

	/**
	 * 커뮤니티 정보 업데이트
	 * 성공시 true 반환
	 * 실패시 false 반환
	 */
	@Override
	public Boolean updateCommunityByNo(Communities communities) {
		// 기존 커뮤니티 정보 획득
		Communities savedCommunity = communityDao.selectCommunityByNo(communities.getNo());
		
		System.out.println("기존방 actived 상태 : " + savedCommunity.getActived());
		
		// 방장이 요청한 메세지인지 확인
		if(communities.getUserNo() != savedCommunity.getUserNo()) {
			return false;
		}
		// 새로 받아온 정보로 덮어씌우기
		savedCommunity.setTitle(communities.getTitle());
		savedCommunity.setIntro(communities.getIntro());
		if(!communities.getPassword().isEmpty()) {
			savedCommunity.setPassword(communities.getPassword());
		}
		
		communityDao.updateCommunity(savedCommunity);
		
		return true;
	}
	
	/**
	 * 모든 기본태그를 조회해서 반환
	 */
	@Override
	public List<CommunityTagsDto> getAllTags() {
		return communityDao.selectAllTags();
	}
	
	/**
	 * 유저번호를 받아서 유저가 현재 참여중인 커뮤니티방에서 해당 유저가 확인하지 않은 컨텐츠의 개수를 조회
	 */
	@Override
	public List<CommunityCntDto> getNewContentCntByUserNo(long userNo) {
		return communityDao.selectNewContentCntByUserNo(userNo);
	}
	
	/**
	 * 유저번호를 받아서 유저가 현재 참여중인 커뮤니티방에서 해당 유저가 확인하지 않은 컨텐츠의 개수를 조회
	 */ 
	@Override 
	public CommunityCntDto getNewContentCntByUserNoAndCommuNo(long userNo, long communityNo) {
		System.out.println("service - getNewContentCntByUserNoAndCommuNo 실행");
		return communityDao.selectNewContentCntByUserNoAndCommuNo(userNo, communityNo);
	}
	
	

	@Override
	public Boolean checkCommuPwd(long communityNo, String password) {
		Communities communities = communityDao.selectCommunityByNo(communityNo);
		if(password.equals(communities.getPassword())) {
			return true;
		}
		return false;
	}
	
	@Override
	public Boolean checkCommuTitle(String title) {
		Communities communities = communityDao.selectCommunityByTitle(title);
		if(null == communities) {
			return true;
		}
		return false;
	}

	@Override
	public String deleteUserFromComGuest(long communityNo, long userNo) {
		
		boolean isEmptyCommunity = false;
		
		System.out.println(" --- deleteUserFromComGuest 실행 ---");
		CommunityGuests communityGuests = communityDao.selectComGuestByUserNoCommuNo(communityNo, userNo);
		System.out.println("방에서 나갈 유저 : " + communityGuests.getUserNo());
		System.out.println("방에서 나갈 유저 : " + communityGuests.getGrade());
		// 방에서 나가는 유저가 방장일경우 다음으로 가장 오래된 유저에게 방장 위임
		if("방장".equals(communityGuests.getGrade())){
			System.out.println(" --- 방장인 경우 --- ");
			CommunityGuests nextBJGuest = communityDao.selectComGuestByRegisteredDate(communityNo, userNo);
			System.out.println("다음 방장은 : "+nextBJGuest);
			if(null != nextBJGuest) {
				nextBJGuest.setGrade("방장");
				communityDao.updateComGuest(nextBJGuest);
				System.out.println("다음 방장 위임 완료 : " + nextBJGuest);
				isEmptyCommunity = false;
			} else {
				// 방장제외하고 아무도 없는 방일 경우
				isEmptyCommunity = true;
			}
		}
		System.out.println("삭제할 것 인가? : " + isEmptyCommunity);
		// 커뮤니티에서 유저비활성화
		communityGuests.setGrade("탈퇴");
		System.out.println("삭제 시작");
		communityDao.updateComGuest(communityGuests);
		System.out.println("삭제 완료");
		
		// 유저가 아무도 없는경우 커뮤니티도 비활성화 
		if(isEmptyCommunity) {
			System.out.println(" --- 커뮤니티 비활성화 --- ");
			Communities communities = communityDao.selectCommunityByNo(communityNo);
			communities.setActived("Y");
			communityDao.updateCommunity(communities);
			return "Y";
		}
		
		return "N";
	}
	
	/**
	 * 커뮤니티번호, 타입을 받아 해당 타입에 해당하는 컨텐츠를 커뮤니티에서 조회해서 반환한다.
	 */
	@Override
	public List<CommunityFileDto> getContentByCommuNoAndType(long communityNo, String type) {
		List<CommunityFileDto> communityFileDtos = new ArrayList<>();
		
		if("image".equals(type)) {
			communityFileDtos = communityDao.selectComImageByNo(communityNo);
		} else if("file".equals(type)) {
			communityFileDtos = communityDao.selectComFileByNo(communityNo);
		} else if("text".equals(type)) {
			communityFileDtos = communityDao.selectComTextByNo(communityNo);
		}
		
		System.out.println("communityFileDto : " + communityFileDtos);
		
		return communityFileDtos;
	}
	
}
