package com.oasis.message;

import java.time.LocalDateTime;


import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class SmsResponse {
    private String requestId;
    
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    private LocalDateTime requestTime;
    private String statusCode;
    private String statusName;
}
