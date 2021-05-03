package product;

import java.time.LocalDateTime;

import cash.CashDAO;
import cash.CashDTO;

public class AuctionService {
	
	private final ProductDAO productDao = new ProductDAO();
	private final CashDAO cashDao = new CashDAO();
	
	public boolean auction(int product_code, int new_price, String newBidderId) {
		// 입찰 가능 여부 확인
		ProductDTO product = productDao.getProduct(product_code);
		if(!product.canBidding(new_price, newBidderId)) {
			return false;
		}
		
		//보증금여부확인
		CashDTO cash = cashDao.infoCash(newBidderId);
		if (!cash.canBidding(new_price)) {
			return false;
		}
		
		// 이전 입찰 보증금 환불
		if(product.getBidder() != null) {
			cashDao.refund(product_code, product.getCurrent_price(), product.getBidder());
		}
		
		// 입찰
		productDao.auction(product_code, new_price, newBidderId);
		cashDao.auction(product_code, new_price, newBidderId);
		
		// 입찰 확정 - 최고가 현재가 동일시
		if (product.getMax_price() == new_price) {
			final_winbid(product_code);
		}
		
		return true;
	}
	
	public void final_winbid(int product_code) {
		ProductDTO product = productDao.getProduct(product_code);
		productDao.final_winbid(product_code);
	}
	//종료시간과 동일시 ( 30초마다 도는중)
	public void final_all() {
		System.out.println("낙찰 확정 중...");
		LocalDateTime dateTime = LocalDateTime.now();
		productDao.final_time(dateTime);
	}
}
