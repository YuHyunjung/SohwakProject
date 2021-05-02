package scheduler;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import product.AuctionService;

public class Scheduler {
    public static final int POOL_SIZE = 1;
    public static final long INTERVAL_TIME = 30;
    public static final TimeUnit INTERVAL_TIME_UNIT = TimeUnit.SECONDS;
    
    private final ScheduledExecutorService scheduler;
    private final AuctionService auctionService = new AuctionService();
    
    public Scheduler() {
    	this.scheduler = Executors.newScheduledThreadPool(POOL_SIZE);
    }
    
    public void execute(Runnable command) {
        scheduler.scheduleAtFixedRate(command, 10, INTERVAL_TIME, INTERVAL_TIME_UNIT);
    }
    
    public void setTasks() {
    	execute(() -> auctionService.final_all());
    }
}
