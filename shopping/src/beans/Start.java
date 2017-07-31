package beans;





public class Start {
	public static void main(String[] args) {
		ProductBean pb=new ProductBean();
		ProductBeanBO pbb=new ProductBeanBO();
		pb.setGoodsId(12);
		pb.setPro_name("131");
		pb.setPro_num(12);
		pb.setPro_price("45");
		pb.setUserId(45);
		pbb.add(pb);
		
//				boolean c = c1.prepared();
//				System.out.print(c);
	}
	

}
