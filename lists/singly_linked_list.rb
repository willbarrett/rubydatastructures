class Node
  attr_accessor :value, :next_node

  def initialize(val, next_in_line)
    @value = val
    @next_node = next_in_line
  end
end

class SinglyLinkedList
  attr_accessor :size

  def initialize
    @size = 0
  end

  def push(value)
    # Traverse to the end of the list
    # then insert a new node there
    if @head
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = Node.new(value, nil)
    else
      @head = Node.new(value, nil)
    end
    @size += 1
    self
  end

  def pop
    previous = @head
    current = @head
    while current.next_node != nil
      previous = current
      current = current.next_node
    end
    if current == @head
      @head = nil
      val = current.value
    else
      previous.next_node = nil
      val = current.value
    end
    @size -= 1
    return val
  end

  def unshift(val)
    if @head
      @head = Node.new(val, @head)
    else
      @head = Node.new(val, nil)
    end
    @size += 1
  end

  def shift
    if @head
      current = @head
      @head = @head.next_node
      @size -= 1
      return current.value
    else
      return nil
    end
  end

  def get(index)
    return nil unless 0 <= index && index < @size
    i = 0
    current = @head
    while i < index
      current = current.next_node
      i += 1
    end
    return current.value
  end

  def insert(index, value)
    return false unless 0 <= index && index <= @size

    current = @head
    i = 0
    while i < index
      previous = current
      current = current.next_node
      i += 1
    end
 
    if previous
      previous.next_node = Node.new(value, current)
    else
      @head = Node.new(value, nil)
    end

    @size += 1

    return self
  end

  def remove(index)
    return false unless 0 <= index && index < @size

    current = @head
    i = 0
    while i < index
      previous = current
      current = current.next_node
      i += 1
    end

    if i == 0
      @head = current.next_node
    else
      previous.next_node = current.next_node
    end
    @size -= 1
  end

  def reverse!
    return unless @head && @head.next_node

    second = @head.next_node
    third = second.next_node

    second.next_node = @head
    @head.next_node = nil

    return unless third

    current = third
    previous = second

    while current != nil
      nxt = current.next_node
      current.next_node = previous

      previous = current
      current = nxt
    end

    @head = previous
  end

  def empty?
    @size == 0
  end

  def empty!
    @head = nil
  end
end
