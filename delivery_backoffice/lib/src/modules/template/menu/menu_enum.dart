enum Menu {
  paymentType(
    '/payment-type/',
    'payment_type_icon.png',
    'payment_type_icon_selected.png',
    'Admistrador Formas de pagamento',
  ),
  products(
    '/products/',
    'produc_icon_selected.png',
    'produc_icon.png',
    'Admistrador de Produtos',
  ),
  orders(
    '/order/',
    'order_icon.png',
    'order_icon_selected.png',
    'Pedidos do dia',
  );

  final String route;
  final String assetIcon;
  final String assetIconSelected;
  final String label;

  const Menu(this.route, this.assetIcon, this.assetIconSelected, this.label);
}
