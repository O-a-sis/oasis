package com.oasis.notification;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.NoArgsConstructor;

@Repository
@NoArgsConstructor
public class EmitterRepositoryImpl implements EmitterRepository{
	
	  private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
	    private final Map<String, Object> eventCache = new ConcurrentHashMap<>();

	@Override
	public SseEmitter save(String emitterId, SseEmitter sseEmitter) {
		emitters.put(emitterId, sseEmitter);
        return sseEmitter;
	}

	@Override
	public void saveEventCache(String eventCacheId, Object event) {
		eventCache.put(eventCacheId, event);
	}

	@Override
	public Map<String, SseEmitter> findAllEmitterStartWithByPhone(String phone) {
		 return emitters.entrySet().stream() //여러개의 Emitter가 존재할 수 있기떄문에 stream 사용
	                .filter(entry -> entry.getKey().startsWith(phone))
	                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	@Override
	public Map<String, SseEmitter> findAllEmitterStartWithByPhoneInList(List phones) {
		return null;
	}

	@Override
	public Map<String, Object> findAllEventCacheStartWithByPhone(String phone) {
        return emitters.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith(phone))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	@Override
	public void deleteById(String id) {
		 emitters.remove(id);
	}

	@Override
	public void deleteAllEmitterStartWithId(String phone) {
		 emitters.forEach((key, emitter) -> {
	            if (key.startsWith(phone)){
	                emitters.remove(key);
	            }
	        });
	}

	@Override
	public void deleteAllEventCacheStartWithId(String phone) {
		emitters.forEach((key, emitter) -> {
            if (key.startsWith(phone)){
                emitters.remove(key);
            }
        });
	}

}
