package _00_init;


/*  
    程式說明：建立表格與設定初始測試資料。
    表格包括：Book, BookCompany, Member, Orders, OrderItems
 
*/
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _00_init.util.HibernateUtils;
import _00_init.util.SystemUtils2018;
import company.attendance.model.Leave;
import company.attendance.model.Punch;
import company.member.model.MemberBean;
import company.shopping.model.ShoppingBean;

public class EDMTableResetHibernate {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			try (FileInputStream fis0 = new FileInputStream("data/Shopping.txt");
					InputStreamReader isr0 = new InputStreamReader(fis0, "UTF-8");
					BufferedReader br0 = new BufferedReader(isr0);) {
				while ((line = br0.readLine()) != null) {
					String[] sa = line.split("\\|");
					ShoppingBean bean = new ShoppingBean();
					bean.setMemberNumber(sa[0]);
					bean.setShoppingType(sa[1]);
					bean.setShoppingname(sa[2]);
					bean.setShoppingProductPrice(Double.parseDouble(sa[3]));
					bean.setShoppingProductDiscount(Double.parseDouble(sa[4]));
					bean.setShoppingDate(new java.sql.Timestamp(System.currentTimeMillis()));
					bean.setShoppingProductTotal(Integer.parseInt(sa[7]));
					bean.setProductrelation(sa[5]);
					// --------------處理Blob(圖片)欄位----------------
					Blob sb = SystemUtils2018.fileToBlob(sa[6]);
					bean.setShoppingProductImage(sb);
					String imageFileName = sa[6].substring(sa[6].lastIndexOf("/") + 1);
					bean.setShoppingfileName(imageFileName);
					session.save(bean);
					count++;}}
			// 3. Member表格
			// 由"data/Input.txt"逐筆讀入Member表格內的初始資料，
			// 然後依序新增到Member表格中
			try (
				FileInputStream fis = new FileInputStream("data/Input.txt");
				InputStreamReader isr0 = new InputStreamReader(fis, "UTF-8");
				BufferedReader br = new BufferedReader(isr0);
			) {
				while ((line = br.readLine()) != null) {
					
					String[] sa = line.split("\\|");
					MemberBean bean = new MemberBean();
					bean.setMemberNumber(sa[0]);
//					String pswd = GlobalService.getMD5Endocing(GlobalService.encryptString(sa[1]));
					bean.setMemberPassword(sa[1]);
					bean.setMemberName(sa[2]);
					bean.setMemberDepartment(sa[3]);
					bean.setMemberGender(sa[4]);
					bean.setMemberAddress(sa[5]);
					bean.setMemberPhone(sa[6]);
					bean.setMemberEmail(sa[7]);
					bean.setMemberRegisterDate(new java.sql.Timestamp(System.currentTimeMillis()));
					bean.setMemberBirthdaay(sa[8]);
					bean.setMemberPerformance(sa[9]);
					bean.setMemberSalary(Integer.parseInt(sa[10]));
					bean.setMemberAdmin(sa[12]);
					// --------------處理Blob(圖片)欄位----------------
					Blob sb = SystemUtils2018.fileToBlob(sa[11]);
					bean.setMemberPicture1(sb);
					String imageFileName = sa[11].substring(sa[11].lastIndexOf("/") + 1);
					bean.setMemberfilename(imageFileName);
					session.save(bean);
					count++;
					System.out.println("新增" + count + "筆記錄:" + sa[0]);

				}
				session.flush();
				System.out.println("Member表格資料新增成功");
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			// 由"data/punch.dat"逐筆讀入punch表格內的初始資料
			try (FileReader fr = new FileReader("data/Punch.txt "); BufferedReader br = new BufferedReader(fr);) {
				while ((line = br.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					Punch punch = new Punch();
					punch.setPunchId(Integer.parseInt(token[0].trim()));
					punch.setMemberDepartment(token[1]);
					punch.setMemberName(token[2]);
					punch.setMemberNumber(Integer.parseInt(token[3].trim()));
					punch.setPunchDate(new SimpleDateFormat("yyyy/MM/dd").parse(token[4]));
					System.out.println(new SimpleDateFormat("yyyy/MM/dd").parse(token[4]));
//					SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					punch.setPunchWorkOn(Timestamp.valueOf(token[5]));
					punch.setPunchWorkOff(Timestamp.valueOf(token[6]));
					session.save(punch);
					System.out.println("新增一筆punch資料成功");
				}
				session.flush();
				System.out.println("punch 資料新增成功");
			} catch (IOException e) {
				System.err.println("新建punch表格時發生IO例外: " + e.getMessage());
			}
			// 由"data/leave.dat"逐筆讀入punch表格內的初始資料
			try (FileReader fr = new FileReader("data/Leave.txt"); BufferedReader br = new BufferedReader(fr);) {
				while ((line = br.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					Leave leave = new Leave();
					leave.setLeaveId(Integer.parseInt(token[0].trim()));
					leave.setMemberDepartment(token[1]);
					leave.setMemberName(token[2]);
					leave.setMemberNumber(Integer.parseInt(token[3].trim()));
					leave.setLeaveDate(new SimpleDateFormat("yyyy/MM/dd").parse(token[4]));
					System.out.println(new SimpleDateFormat("yyyy/MM/dd").parse(token[4]));
					leave.setLeaveStart(Timestamp.valueOf(token[5]));
					leave.setLeaveEnd(Timestamp.valueOf(token[6]));
					leave.setLeaveCategory(token[7]);
					leave.setLeaveCause(token[8]);
					session.save(leave);
					System.out.println("新增一筆leave資料成功");
				}
				session.flush();
				System.out.println("leave 資料新增成功");
			} catch (IOException e) {
				System.err.println("新建leave表格時發生IO例外: " + e.getMessage());
			}
			
            tx.commit();
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
			tx.rollback();
		} 
        factory.close();
	
		}
}