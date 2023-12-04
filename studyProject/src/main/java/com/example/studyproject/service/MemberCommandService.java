package com.example.studyproject.service;

import com.example.studyproject.domain.Member;
import com.example.studyproject.web.dto.MemberRequestDTO;

public interface MemberCommandService {
    public Member joinMember(MemberRequestDTO.JoinDto request);
}
