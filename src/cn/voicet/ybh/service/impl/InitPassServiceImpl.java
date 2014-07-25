package cn.voicet.ybh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.voicet.ybh.dao.InitPassDao;
import cn.voicet.ybh.service.InitPassService;
import cn.voicet.ybh.util.DotSession;

@Transactional(readOnly=true)
@Service(InitPassService.SERVICE_NAME)
public class InitPassServiceImpl implements InitPassService {
	@Resource(name=InitPassDao.SERVICE_NAME)
	private InitPassDao initPassDao;
	public void initPasswordByDqbm(DotSession ds, String dqbm) {
		initPassDao.initPasswordByDqbm(ds, dqbm);
	}
}
