package test.com.xiaoke1256.orders.core.task;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import com.xiaoke1256.orders.core.task.SendingExpiredTask;
import com.xiaoke1256.orders.SpringbootApplication;

@RunWith(SpringRunner.class)
@SpringBootTest(classes=SpringbootApplication.class)
@ActiveProfiles("test")
public class TestSendingExpiredTask {
	@Autowired
	private SendingExpiredTask sendingExpiredTask;
	
	@Test
	public void testSend() {
		sendingExpiredTask.sendExpired();
	}
}
