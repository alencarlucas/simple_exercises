defmodule HarryPotterBookstoreTest do
  use ExUnit.Case

  test "obtains the list of books bought" do
    shopping_cart = [{1, 1}]
    assert HarryPotterBookstore.books_bought(shopping_cart) == [1]

    assert HarryPotterBookstore.books_bought([{1, 1}, {7, 3}, {5, 5}, {2, 4}]) ==
             [1, 7, 5, 2]
  end

  test "all books" do
    shopping_cart = [{1, 1}]
    assert HarryPotterBookstore.all_books(shopping_cart) == [1]

    assert HarryPotterBookstore.all_books([{1, 1}, {7, 3}, {5, 5}, {2, 4}]) ==
             [5, 5, 5, 5, 5, 2, 2, 2, 2, 7, 7, 7, 1]

    shopping_cart = [{1, 1}, {2, 1}]
    assert HarryPotterBookstore.all_books(shopping_cart) == [1, 2]
  end

  test "count group books" do
    all_books = [1, 2]
    assert HarryPotterBookstore.count_group_books(all_books, 2) == 2
  end

  test "calculate the full price of a shopping cart" do
    shopping_cart = [{1, 1}]
    assert HarryPotterBookstore.full_price(shopping_cart, 8) == 8

    shopping_cart = [{1, 2}]
    assert HarryPotterBookstore.full_price(shopping_cart, 8) == 16

    shopping_cart = [{1, 2}, {2, 3}]
    assert HarryPotterBookstore.full_price(shopping_cart, 8) == 40
  end

  test "count number of two copies of different books in a shopping cart" do
    shopping_cart = [{1, 1}]
    assert HarryPotterBookstore.two_copies(shopping_cart) == 0

    shopping_cart = [{1, 1}, {2, 1}]
    assert HarryPotterBookstore.two_copies(shopping_cart) == 2

    shopping_cart = [{1, 3}, {2, 2}, {3, 2}]
    assert HarryPotterBookstore.two_copies(shopping_cart) == 6

    shopping_cart = [{1, 3}, {2, 2}, {3, 2}, {4, 1}]
    assert HarryPotterBookstore.two_copies(shopping_cart) == 8
  end

  test "calculate 5% discount for two books" do
    shopping_cart = [{1, 1}]
    assert HarryPotterBookstore.discount_two_copies(shopping_cart, 8) == 8

    shopping_cart = [{1, 1}, {2, 1}]
    assert HarryPotterBookstore.discount_two_copies(shopping_cart, 8) == 16 * 0.95

    shopping_cart = [{1, 3}, {2, 2}, {3, 2}]
    assert HarryPotterBookstore.discount_two_copies(shopping_cart, 8) == 8 + 6 * 8 * 0.95

    shopping_cart = [{1, 3}, {2, 2}, {3, 2}, {4, 1}]
    assert HarryPotterBookstore.discount_two_copies(shopping_cart, 8) == 8 * 8 * 0.95
  end

  test "count number of three copies of different books in a shopping cart" do
    shopping_cart = [{1, 1}]
    assert HarryPotterBookstore.three_copies(shopping_cart) == 0

    shopping_cart = [{1, 1}, {2, 1}, {3, 1}]
    assert HarryPotterBookstore.three_copies(shopping_cart) == 3

    shopping_cart = [{1, 3}, {2, 2}, {3, 2}]
    assert HarryPotterBookstore.three_copies(shopping_cart) == 6

    shopping_cart = [{1, 3}, {2, 2}, {3, 2}, {4, 1}]
    assert HarryPotterBookstore.three_copies(shopping_cart) == 6
  end

  test "calculate 10% discount for three books" do
    shopping_cart = [{1, 1}]
    assert HarryPotterBookstore.discount_three_copies(shopping_cart, 8) == 8

    shopping_cart = [{1, 1}, {2, 1}, {3, 1}]
    assert HarryPotterBookstore.discount_three_copies(shopping_cart, 8) == 3 * 8 * 0.90

    shopping_cart = [{1, 3}, {2, 2}, {3, 2}]
    assert HarryPotterBookstore.discount_three_copies(shopping_cart, 8) == 8 + 6 * 8 * 0.90

    shopping_cart = [{1, 3}, {2, 2}, {3, 2}, {4, 1}]
    assert HarryPotterBookstore.discount_three_copies(shopping_cart, 8) == 6 * 8 * 0.90 + 8 * 2
  end
end
