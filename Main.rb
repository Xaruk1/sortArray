require 'minitest/autorun'

def max(inputArray)

  array = inputArray.dup
  max = array[0]
  array.each do |arr|
    if max < arr
      max = arr
    end
  end

  return max

end

def min(inputArray)

  array = inputArray.dup
  min = array[0]
  array.each do |arr|
    if min > arr
      min = arr
    end
  end

  return min

end

def bubbleSort(inputArray)

  array = inputArray.dup

  (0...array.length).each do
  |i|
    (0...array.length - i - 1).each do
    |j|
      if array[j] > array[j + 1]
        array[j], array[j + 1] = array[j + 1], array[j]
      end
    end
  end

  return array

end

def show_bubbleSort(inputArray)
  puts 'Метод пузырьковой сортировки: ' + bubbleSort(inputArray).join(', ')
end


def insertSort(inputArray)

  array = inputArray.dup

  (1...array.length).each do
  |j|
    key = array[j]
    i = j - 1
    while i >= 0 and array[i] > key
      array[i + 1] = array[i]
      i = i - 1
      p array
    end
    array[i + 1] = key
  end

  return array

end

def show_insertSort(inputArray)
  puts 'Метод сортировки вставками: ' + insertSort(inputArray).join(', ')
end


def quickSort(inputArray)

  return inputArray if inputArray.length <= 1

  array = inputArray.dup
  key = array[array.length / 2]
  array.delete_at(array.length / 2)
  minMas = Array.new
  maxMas = Array.new

  array.each do
  |current|
    if key >= current
      minMas << current
    else
      maxMas << current
    end
  end

  return quickSort(minMas) + [key] + quickSort(maxMas)

end


def show_QuickSort(inputArray)
  puts 'Метод быстрой сортировки: ' + quickSort(inputArray).join(', ')
end


def countingSort(inputArray)

  array = inputArray.dup
  minMax = max(array) - min(array)
  helpArray = Array.new(minMax + 1, 0)
  normalization = -minMax
  array.each do |i|
    i += normalization
    helpArray[i] += 1
  end
  array.clear
  (0...helpArray.size).each do |i|
    helpArray[i].times do
      array << i -= normalization
    end
  end

  return quickSort(inputArray)

end

def show_countingSort(inputArray)
  puts 'Метод сортировки подсчетами: ' + countingSort(inputArray).join(', ')
end


class Main

  puts 'Введите массив через пробел'
  array = gets.chomp.split(' ').map(&:to_i)
  puts 'Заданный массив: ' + array.join(', ')
  puts
  puts 'Максимальное значение = ' + max(array).to_s
  puts 'Минимальное значение = ' + min(array).to_s
  puts
  puts show_bubbleSort(array)
  puts show_insertSort(array)
  puts show_QuickSort(array)
  puts show_countingSort(array)
end


#UnitTest
class Test < Minitest::Test

  def setup
    @testArray = [5, 1, 45, 6, 23]
    @normalArray = [1, 5, 6, 23, 45]
  end

  def test_max
    assert_equal 45, max(@testArray)
  end

  def test_min
    assert_equal 1, min(@testArray)
  end

  def test_BubbleSort
    assert_equal @normalArray, bubbleSort(@testArray)
  end

  def test_insertSort
    assert_equal @normalArray, insertSort(@testArray)
  end

  def test_quickSort
    assert_equal @normalArray, quickSort(@testArray)
  end

  def test_countingSort
    assert_equal @normalArray, countingSort(@testArray)
  end


end