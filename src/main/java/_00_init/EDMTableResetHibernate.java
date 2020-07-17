package _00_init;


/*  
    程式說明：建立表格與設定初始測試資料。
    表格包括：Book, BookCompany, Member, Orders, OrderItems
 
*/
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Blob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _00_init.util.HibernateUtils;
import _00_init.util.SystemUtils2018;
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
            tx.commit();
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
			tx.rollback();
		} 
        factory.close();
	
		}
}