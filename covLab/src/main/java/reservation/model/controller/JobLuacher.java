package reservation.model.controller;

import java.text.ParseException;
import java.util.HashSet;
import java.util.Set;

import org.quartz.CronExpression;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;


class JobLuacher {
    public static void main(String[] args) {
        try {
            
            // Scheduler 생성
            SchedulerFactory factory = new StdSchedulerFactory();
            Scheduler scheduler = factory.getScheduler();
            
            // Scheduler 실행
            scheduler.start();
            
            // JOB Data 객체 생성
            JobDataMap jobDataMap = new JobDataMap();
            jobDataMap.put("message", "백신 여유분이 발생했습니다!!!");
            jobDataMap.put(null, false);
            
            // JOB Executor Class
            Class<? extends Job> jobClass = SampleJobExecutor.class;
 
            // JOB 생성
            JobDetail jobDetail = JobBuilder.newJob(jobClass)
                                    .withIdentity("job_name", "job_group")
                                    .setJobData(jobDataMap)
                                    .build();
            
			/*
			 * // SimpleTrigger 생성 // 4초마다 반복하며, 최대 5회 실행 SimpleScheduleBuilder simpleSch =
			 * SimpleScheduleBuilder.repeatSecondlyForTotalCount(5, 4); SimpleTrigger
			 * simpleTrigger = (SimpleTrigger) TriggerBuilder.newTrigger()
			 * .withIdentity("simple_trigger", "simple_trigger_group")
			 * .withSchedule(simpleSch) .forJob(jobDetail) .build();
			 */
 
            // CronTrigger 생성
            // 15초주기로 반복( 0, 15, 30, 45 ) "0 0/30 9-18 * 1-5 ?"
            CronScheduleBuilder cronSch = CronScheduleBuilder.cronSchedule(new CronExpression("0/5 * * * * ?"));
            CronTrigger cronTrigger = (CronTrigger) TriggerBuilder.newTrigger()
                                        .withIdentity("cron_trigger", "cron_trigger_group")
                                        .withSchedule(cronSch)
                                        .forJob(jobDetail)
                                        .build();
            
            // JobDtail : Trigger = 1 : N 설정
            Set<Trigger> triggerSet = new HashSet<Trigger>();
//            triggerSet.add(simpleTrigger);
            triggerSet.add(cronTrigger);
 
            // Schedule 등록
            scheduler.scheduleJob(jobDetail, triggerSet, false);
            
        } catch (ParseException | SchedulerException e) {
            e.printStackTrace();
        }
    }
}