package product;

import cash.CashDAO;
import cash.CashDTO;

public class AuctionService {
	
	private final ProductDAO productDao = new ProductDAO();
	private final CashDAO cashDao = new CashDAO();
	
	public boolean auction(int product_code, int new_price, String newBidderId) {
		// ���� ���� ���� Ȯ��
		ProductDTO product = productDao.getProduct(product_code);
		if(!product.canBidding(new_price, newBidderId)) {
			return false;
		}
		
		//�����ݿ���Ȯ��
		CashDTO cash = cashDao.infoCash(newBidderId);
		if (!cash.canBidding(new_price)) {
			return false;
		}
		
		// ���� ���� ������ ȯ��
		if(product.getBidder() != null) {
			cashDao.refund(product_code, product.getCurrent_price(), product.getBidder());
		}
		
		// ����
		productDao.auction(product_code, new_price, newBidderId);
		cashDao.auction(product_code, new_price, newBidderId);
		
		// ���� Ȯ��
		if (product.getMax_price() == new_price) {
			final_winbid(product_code);
		}
		
		return true;
	}
	
	public boolean final_winbid(int product_code) {
		ProductDTO product = productDao.getProduct(product_code);
		productDao.final_winbid(product_code);
		
		return true;
	}
}
