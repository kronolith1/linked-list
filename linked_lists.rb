class LinkedList

  def initialize
    @tail = nil
    @head = nil
    @count = 0
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
      @tail = @head
    else
      node = Node.new(value)  
      @tail.next_node = node
      @tail = node
    end
    @count += 1
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value)
      @tail = @head
    else
      old_head = @head
      @head = Node.new(value)
      @head.next_node = old_head
    end
    @count += 1
  end

  def size
    return @count
  end

  def head
    return @head
  end

  def tail
    return @tail
  end

  def at(index)
    return nil if index > @count
    node = @head
    index.times do
      node = node.next_node
    end
    node
  end
  
  def pop
    old_tail = @tail.value
    new_tail = at(@count - 2)
    new_tail.next_node = nil
    @count -= 1
    old_tail
  end

  def contains?(value)
    return false if @count == 0
    node = @head
    @count.times do
      return true if node.value == value
      node = node.next_node
    end
    return false
  end

  def find(value)
    return nil if @count == 0
    node = @head
    @count.times do |n|
      return n if node.value == value
      node = node.next_node
    end
    return nil
  end

  def insert_at(value, index)
    append(value) if index > @count
    new_node = Node.new(value)
    mod_node = at(index - 1)
    new_node.next_node = mod_node.next_node
    mod_node.next_node = new_node
    @count += 1
  end

  def remove_at(index)
    return nil if index > @count
    if  index == 0
      del_node = at(index)
      @head = del_node.next_node
    else 
      mod_tail = at(index - 1)
      del_node = at(index)
      mod_tail.next_node = del_node.next_node
    end
    @count -= 1
  end

  
  def to_s
    string = ""
    node = @head
    @count.times do
      if node.next_node == nil
        string << "( #{ node.value } ) -> ( nil )"
      else
        string << "( #{ node.value } ) -> "
      end
      node = node.next_node
    end
    string
  end
end


class Node
  attr_accessor :value, :next_node

  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


list = LinkedList.new()
# p list
list.append("1")
list.append("2")
list.append("3")
list.append("5")
list.insert_at("4", 3)
puts list
list.remove_at(-2)
puts list