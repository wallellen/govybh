package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhMemberDao;
import cn.voicet.ybh.service.YbhMemberService;
import cn.voicet.ybh.util.DotSession;

@Transactional(readOnly=true)
@Service(YbhMemberService.SERVICE_NAME)
public class YbhMemberServiceImpl implements YbhMemberService{
	
	@Resource(name=YbhMemberDao.SERVICE_NAME)
	private YbhMemberDao ybhMemberDao;

	public void getSelectedXianList(DotSession ds) {
		ybhMemberDao.getSelectedXianList(ds);
	}

	public void getMemberInfoList(DotSession ds) {
		ybhMemberDao.getMemberInfoList(ds);		
	}

}
