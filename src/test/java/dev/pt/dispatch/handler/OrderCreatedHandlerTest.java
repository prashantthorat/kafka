package dev.pt.dispatch.handler;

import dev.pt.dispatch.message.OrderCreated;
import dev.pt.dispatch.service.DispatchService;
import dev.pt.dispatch.util.TestEventData;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class OrderCreatedHandlerTest {

    private OrderCreatedHandler orderCreatedHandler;
    private DispatchService dispatchServiceMock;
    @BeforeEach
    void setUp() {
        dispatchServiceMock= mock(DispatchService.class);
        orderCreatedHandler=new OrderCreatedHandler(dispatchServiceMock);
    }

    @Test
    void listen() {
        OrderCreated testEvent= TestEventData.buildOrderCreatedEvent(UUID.randomUUID(),UUID.randomUUID().toString());
        orderCreatedHandler.listen(testEvent);
        verify(dispatchServiceMock,times(1)).process(testEvent);
    }
}