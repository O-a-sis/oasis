package com.oasis.notification;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface EmitterRepository {

    SseEmitter save(String emitterId, SseEmitter sseEmitter); //Emitter 저장
    
    void saveEventCache(String eventCacheId, Object event); //이벤트 저장
    
    Map<String, SseEmitter> findAllEmitterStartWithByPhone(String phone); //해당 회원과  관련된 모든 Emitter를 찾는다
    
    Map<String, SseEmitter> findAllEmitterStartWithByPhoneInList(List phones); //List 에서 해당 회원과  관련된 모든 Emitter를 찾는다(미 개발)
    
    Map<String, Object> findAllEventCacheStartWithByPhone(String phone); //해당 회원과관련된 모든 이벤트를 찾는다
    
    void deleteById(String id); //Emitter를 지운다
    
    void deleteAllEmitterStartWithId(String phone); //해당 회원과 관련된 모든 Emitter를 지운다
    
    void deleteAllEventCacheStartWithId(String phone); //해당 회원과 관련된 모든 이벤트를 지운다
}
