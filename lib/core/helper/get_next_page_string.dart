String getNextPageString(int pageIndex) {
  late String text;
  switch (pageIndex) {
    case 0:
      text = 'التالي';
      break;
    case 1:
      text = 'التالي';
      break;
    case 2:
      text = 'الدفع عبر Paypal';
      break;
  }
  return text;
}
