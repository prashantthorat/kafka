package dev.pt.dispatch.service;

import dev.pt.dispatch.message.OrderCreated;
import dev.pt.dispatch.util.TestEventData;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

class DispatchServiceTest {

    private DispatchService dispatchService;

    @BeforeEach
    void setUp() {
        dispatchService=new DispatchService();
    }

    @Test
    void process() {
        OrderCreated testEvent= TestEventData.buildOrderCreatedEvent(UUID.randomUUID(),UUID.randomUUID().toString());
        dispatchService.process(testEvent);
    }
}