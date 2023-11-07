package dev.pt.dispatch.util;

import dev.pt.dispatch.message.OrderCreated;
import lombok.Builder;

import java.util.UUID;

@Builder
public class TestEventData {

    public static OrderCreated buildOrderCreatedEvent(UUID uuid, String item){
        return OrderCreated.builder().orderId(uuid).item(item).build();

    }
}
