package uz.pdp.homework_8courcejsp.entity.req;

import lombok.Data;


public record PaymentForCourseReq(String courseName,Integer studentCount,Integer paymentAmount) {
}
