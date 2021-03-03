package com.example.FinalProject.utils;

import java.util.concurrent.atomic.AtomicLong;

public class IdGenerator {

    private static final AtomicLong TS = new AtomicLong(System.currentTimeMillis() * 1000);
    public static long generateId() {
        return TS.incrementAndGet();
    }

}
