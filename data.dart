import 'models.dart';

const categories = ['All', 'Fruits', 'Vegetables', 'Dairy', 'Bakery', 'Snacks', 'Beverages'];

const products = <Product>[
  Product(id: 'f1', name: 'Apple', category: 'Fruits', emoji: '🍎', price: 180, unit: '1 kg'),
  Product(id: 'f2', name: 'Banana', category: 'Fruits', emoji: '🍌', price: 60, unit: '1 dozen'),
  Product(id: 'f3', name: 'Mango', category: 'Fruits', emoji: '🥭', price: 150, unit: '1 kg'),
  Product(id: 'f4', name: 'Grapes', category: 'Fruits', emoji: '🍇', price: 90, unit: '500 g'),
  Product(id: 'v1', name: 'Tomato', category: 'Vegetables', emoji: '🍅', price: 40, unit: '1 kg'),
  Product(id: 'v2', name: 'Potato', category: 'Vegetables', emoji: '🥔', price: 35, unit: '1 kg'),
  Product(id: 'v3', name: 'Carrot', category: 'Vegetables', emoji: '🥕', price: 50, unit: '500 g'),
  Product(id: 'v4', name: 'Broccoli', category: 'Vegetables', emoji: '🥦', price: 70, unit: '1 pc'),
  Product(id: 'd1', name: 'Milk', category: 'Dairy', emoji: '🥛', price: 32, unit: '500 ml'),
  Product(id: 'd2', name: 'Cheese', category: 'Dairy', emoji: '🧀', price: 120, unit: '200 g'),
  Product(id: 'd3', name: 'Eggs', category: 'Dairy', emoji: '🥚', price: 84, unit: '12 pcs'),
  Product(id: 'b1', name: 'Bread', category: 'Bakery', emoji: '🍞', price: 45, unit: '1 loaf'),
  Product(id: 'b2', name: 'Croissant', category: 'Bakery', emoji: '🥐', price: 55, unit: '2 pcs'),
  Product(id: 's1', name: 'Chips', category: 'Snacks', emoji: '🍟', price: 20, unit: '1 pack'),
  Product(id: 's2', name: 'Cookies', category: 'Snacks', emoji: '🍪', price: 40, unit: '1 pack'),
  Product(id: 'k1', name: 'Orange Juice', category: 'Beverages', emoji: '🧃', price: 99, unit: '1 L'),
  Product(id: 'k2', name: 'Tea', category: 'Beverages', emoji: '🍵', price: 140, unit: '250 g'),
  Product(id: 'k3', name: 'Coffee', category: 'Beverages', emoji: '☕', price: 220, unit: '200 g'),
];
