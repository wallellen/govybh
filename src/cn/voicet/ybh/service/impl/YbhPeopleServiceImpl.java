package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.YbhPeopleDao;
import cn.voicet.ybh.service.YbhPeopleService;
import cn.voicet.ybh.util.DotSession;

@Transactional(readOnly=true)
@Service(YbhPeopleService.SERVICE_NAME)
public class YbhPeopleServiceImpl implements YbhPeopleService{
	
	@Resource(name=YbhPeopleDao.SERVICE_NAME)
	private YbhPeopleDao ybhPeopleDao;

	public void getSelectedHuList(DotSession ds) {
		ybhPeopleDao.getSelectedHuList(ds);
	}

}
