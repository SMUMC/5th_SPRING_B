package study.base.exception.handler;

import study.base.Code;
import study.base.exception.GeneralException;

public class TempHandler extends GeneralException {
    public TempHandler(Code errorCode){
        super(errorCode);
    }

}
