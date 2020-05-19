enum OrderBy { DATE, PRICE }

const VENDOR_TYPE_PARTICULAR = 1 << 0; //isso representa 0000
const VENDOR_TYPE_PROFESSIONAL = 1 << 1; //isso representa 0010

//agora pra juntar as duas opcoes usamos o OU logico
//VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL //0011

class Filter {
  String search;
  OrderBy orderBy;
  int minPrice;
  int maxPrice;
  int vendorType;

  Filter({
    this.search,
    this.orderBy = OrderBy.DATE,
    this.minPrice,
    this.maxPrice,
    this.vendorType = VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL,
  });
}
