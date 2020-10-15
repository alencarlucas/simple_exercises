defmodule HarryPotterBookstore do
  def books_bought(shopping_cart) do
    Enum.map(shopping_cart, fn {livro, _quantidade} -> livro end)
  end

  def full_price(shopping_cart, price) do
    (Enum.map(shopping_cart, fn {_livro, quantidade} -> quantidade end) |> Enum.sum()) * price
  end

  def all_books(shopping_cart) do
    shopping_cart
    |> Enum.sort_by(fn {_, quantidade} -> quantidade end, :desc)
    |> Enum.map(fn {livro, quantidade} -> List.duplicate(livro, quantidade) end)
    |> List.flatten()
  end

  def count_group_books(all_books, group_length, group_count \\ 0) do
    uniq_books = Enum.uniq(all_books)

    if length(uniq_books) < group_length do
      group_count
    else
      count_group_books(
        all_books -- Enum.slice(uniq_books, 0..group_length-1),
        group_length,
        group_count + group_length
      )
    end
  end

  def two_copies(shopping_cart) do
    count_group_books(
      all_books(shopping_cart),
      2
    )
  end

  def discount_two_copies(shopping_cart, price) do
    two_copies = two_copies(shopping_cart)
    all_books = all_books(shopping_cart)
    (two_copies * 0.95 + (length(all_books) - two_copies)) * price
  end

  def three_copies(shopping_cart) do
    count_group_books(
      all_books(shopping_cart),
      3
    )
  end

  def discount_three_copies(shopping_cart, price) do
    three_copies = three_copies(shopping_cart)
    all_books = all_books(shopping_cart)
    (three_copies * 0.90 + (length(all_books) - three_copies)) * price
  end

  def four_copies(shopping_cart) do
    count_group_books(
      all_books(shopping_cart),
      4
    )
  end

  def discount_four_copies(shopping_cart, price) do
    four_copies = four_copies(shopping_cart)
    all_books = all_books(shopping_cart)
    (four_copies * 0.85 + (length(all_books) - four_copies)) * price
  end

  def five_copies(shopping_cart) do
    count_group_books(
      all_books(shopping_cart),
      5
    )
  end

  def discount_five_copies(shopping_cart, price) do
    five_copies = five_copies(shopping_cart)
    all_books = all_books(shopping_cart)
    (five_copies * 0.80 + (length(all_books) - five_copies)) * price
  end
end
