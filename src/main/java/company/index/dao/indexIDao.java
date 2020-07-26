package company.index.dao;

import java.util.List;

import company.index.model.indexBean;

public interface indexIDao {
	List<indexBean> getAllProducts(); // 全部商品

	void addindexpicture(indexBean product);// 新增新產品

	indexBean getindexId(Integer indexId);// 取出某一個商品

	void update(indexBean indexId);// 更新商品資料

	void delete(Integer indexId);// 刪除商品資料

}
