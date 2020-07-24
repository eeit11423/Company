package _00_init;


/*  
    程式說明：建立表格與設定初始測試資料。
    表格包括：Book, BookCompany, Member, Orders, OrderItems
 
*/
import java.io.BufferedReader;
import java.io.File;
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
import company.shopping.model.OrderBean;
import company.shopping.model.OrderItemBean;
import company.shopping.model.ShoppingBean;
import company.train.model.CompanyBean;
import company.train.model.TrainingBean;

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
			
			// 1. 由"data/trainCompany.dat"逐筆讀入trainCompany表格內的初始資料，
			// 然後依序新增到trainCompany表格中
			try (
				FileReader fr = new FileReader("data/trainCompany.dat"); 
				BufferedReader br = new BufferedReader(fr);
			) {
				while ((line = br.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					String name = token[0];
					String address = token[1];
					String url = token[2];
					CompanyBean cb = new CompanyBean(null, name, address, url);
					session.save(cb);
				}
			} catch (IOException e) {
				System.err.println("新建TrainCompany表格時發生IO例外: " + e.getMessage());
			}
			session.flush();
			System.out.println("TrainCompany 資料新增成功");

			File file = new File("data/train.dat");
			// 2. 由"data/train.dat"逐筆讀入train表格內的初始資料，然後依序新增
			// 到train表格中
			try (
				FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);
			) {
				while ((line = br.readLine()) != null) {
					System.out.println("line=" + line);
					// 去除 UTF8_BOM: \uFEFF
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					TrainingBean train = new TrainingBean();
					train.setTrainingCourse(token[0]);
					train.setTrainingCredit(Integer.parseInt(token[1].trim()));
					train.setTrainingStartDate(Integer.parseInt(token[2].trim()));
					train.setTrainingEndDate(Integer.parseInt(token[3].trim()));
					// book.setCompanyId(Integer.parseInt(token[4].trim()));
					int companyId = Integer.parseInt(token[4].trim());
					train.setBrief(token[5]);
					train.setElaborate(token[6]);
					train.setCourseNo(token[8].trim());
					train.setCategory(token[9].trim());
					train.setURLUpload(token[11].trim());
					CompanyBean cb = session.get(CompanyBean.class, companyId);
					train.setCompanyBean(cb);
					// 讀取圖片檔
					Blob blob = SystemUtils2018.fileToBlob(token[7].trim());
					train.setPictureFile(blob);
//					train.setPictureName(SystemUtils2018.extractFileName(token[7].trim()));					
//					session.save(train);
//					String imageFileName = token[7].substring(token[7].lastIndexOf("/") + 2);
//					train.setPictureName(imageFileName);
					train.setpictureName(token[10].trim());
					session.save(train);
					count++;
					System.out.println("新增一筆Train紀錄成功");
				}
				// 印出資料新增成功的訊息
				session.flush();
				System.out.println("Train資料新增成功");
			}
			
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
			
//			 由"data/punch.dat"逐筆讀入punch表格內的初始資料
			try (FileReader fr = new FileReader("data/Punch.txt "); BufferedReader br = new BufferedReader(fr);) {
				count = 0;
				while ((line = br.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					Punch punch = new Punch();
					punch.setPunchId(Integer.parseInt(token[0].trim()));
					punch.setMemberDepartment(token[1]);
					punch.setMemberName(token[2]);
					punch.setMemberNumber((token[3]));
					punch.setPunchDate(new SimpleDateFormat("yyyy/MM/dd").parse(token[4]));
					System.out.println(new SimpleDateFormat("yyyy/MM/dd").parse(token[4]));
					SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					punch.setPunchWorkOn(Timestamp.valueOf(token[5]));
					punch.setPunchWorkOff(Timestamp.valueOf(token[6]));
					punch.setPunchHours(Long.parseLong((token[7].trim())));
					session.save(punch);
					count++;
					System.out.println("新增" + count +"筆punch資料成功");
				}
				session.flush();
				System.out.println("punch 資料新增成功");
			} catch (IOException e) {
				System.err.println("新建punch表格時發生IO例外: " + e.getMessage());
			}
			
			
//			 //由"data/orderbean.dat"逐筆讀入punch表格內的初始資料
//				try (FileReader fr = new FileReader("data/orderbean.txt "); BufferedReader br = new BufferedReader(fr);) {
//					while ((line = br.readLine()) != null) {
//						if (line.startsWith(UTF8_BOM)) {
//							line = line.substring(1);
//						}
//						String[] token = line.split("\\|");
//						OrderBean ob = new OrderBean();
//						
//					ob.setMemberNumber(token[0]);
//					ob.setOrderAddress(token[1]);
//					ob.setOrderTotalPrice(Double.parseDouble(token[2].trim()));
//				ob.setOrderDate(new java.sql.Timestamp(System.currentTimeMillis()));
//						
//						SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//					
//						session.save(ob);
//						System.out.println("新增一筆punch資料成功");
//					}
//					session.flush();
//					System.out.println("punch 資料新增成功");
//				} catch (IOException e) {
//					System.err.println("新建punch表格時發生IO例外: " + e.getMessage());
//				}
//				
//				//由"data/orderItemBean.dat"逐筆讀入punch表格內的初始資料
//				try (FileReader fr = new FileReader("data/orderItemBean.txt "); BufferedReader br = new BufferedReader(fr);) {
//					while ((line = br.readLine()) != null) {
//						if (line.startsWith(UTF8_BOM)) {
//							line = line.substring(1);
//						}
//						String[] token = line.split("\\|");
//						OrderItemBean oib = new OrderItemBean();
//						
//						oib.setOrderItemsNumber(Integer.parseInt(token[0].trim()));
//					    oib.setShoppingId(Integer.parseInt(token[1].trim()));
//					    oib.setShoppingProductName(token[2]);
//					    oib.setProductrelatio(token[3]);
//					    oib.setShoppingProductPrice(Double.parseDouble(token[4].trim()));
//					    oib.setShoppingProductDiscount(Double.parseDouble(token[5].trim()));
//					    
//					    
//					    
//					    
//					    session.save(oib);
//						System.out.println("新增一筆punch資料成功");
//					}
//					session.flush();
//					System.out.println("punch 資料新增成功");
//				} catch (IOException e) {
//					System.err.println("新建punch表格時發生IO例外: " + e.getMessage());
//				}
				
				
				
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
					leave.setMemberNumber(token[3]);
					leave.setLeaveDate(new SimpleDateFormat("yyyy/MM/dd").parse(token[4]));
					System.out.println(new SimpleDateFormat("yyyy/MM/dd").parse(token[4]));
					leave.setLeaveStart(Timestamp.valueOf(token[5]));
					leave.setLeaveEnd(Timestamp.valueOf(token[6]));
					leave.setLeaveCategory(token[7]);
					leave.setLeaveHours(Long.parseLong((token[8].trim())));
					leave.setLeaveCause(token[9]);
					leave.setLeaveAudit(token[10]);
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