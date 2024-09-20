import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class OrderCode {
	//生成一个订单编号，订单编号格式规则：
	//当前日期+流水号（5位随机数字加字母）
	//例如：20240115AX32B
	public static String createOrderNo() {
		//当前日期转换成字符串
		//方式1
		//toString():按照默认日期格式yyyy-MM-dd,转换成字符串
		//	String order1=LocalDate.now().toString();
		//方式2
		//format():按照指定日期格式yyyy年MM月dd,转换成字符串
		//String order=LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy年MM月dd日"）
		String order= LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy年MM月dd日"));
		//format():按照指定日期格式yyyyMMdd,转换成字符串
		String orderno=LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		//流水线
		String traceId= UUID.randomUUID().toString().substring(0,5).toUpperCase();
		//System.out.println(traceId);
		//订单编号=当前日期+流水线
		orderno=orderno+traceId;
		System.out.println("新订单编号：\n"+orderno);
		return orderno;
	}
}
