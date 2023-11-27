package com.example.studyproject.base.exception.handler;

import com.example.studyproject.base.Code;
import com.example.studyproject.base.exception.GeneralException;

public class TempHandler extends GeneralException {
    public TempHandler(Code errorCode){
        super(errorCode);
    }
}