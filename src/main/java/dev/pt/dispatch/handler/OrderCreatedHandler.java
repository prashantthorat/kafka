package dev.pt.dispatch.handler;

import dev.pt.dispatch.message.OrderCreated;
import dev.pt.dispatch.service.DispatchService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Slf4j
@RequiredArgsConstructor
@Component
public class OrderCreatedHandler {

    private final DispatchService dispatchService;

    @KafkaListener(
            id="orderConsumerClient",
            topics = "order.created",
            groupId = "dispatch.order.created.consumer"
    )
    public void listen(OrderCreated payload){
     log.info("Received message: payload: "+ payload);
     dispatchService.process(payload);
    }
}
