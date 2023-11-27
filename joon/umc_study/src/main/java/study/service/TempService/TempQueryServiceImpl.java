package study.service.TempService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import study.base.exception.handler.TempHandler;

import study.base.Code;

@Service
@RequiredArgsConstructor
public class TempQueryServiceImpl implements TempQueryService{

    @Override
    public void CheckFlag(Integer flag){
        if (flag == 1)
            throw new TempHandler(Code.TEST_EXCEPTION);

    }
}
