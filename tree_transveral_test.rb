class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

def depth_first_search(node, value)
  if node.payload == value
    return node
  else
    node.children.each do |child|
      result = depth_first_search(child, value)
      if result.payload == value
        return result
      end
    end
    return node
  end
  return nil
end


# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])


# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])


puts depth_first_search(trunk, 11).payload
# puts depth_first_search(trunk, 7).payload
# puts depth_first_search(trunk, 2).payload

class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end


queue = Queue.new

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
puts queue.dequeue
queue.enqueue(6)
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue

def breadth_first_search(node, value)
  children = [node]
  # children.each do |node|
  while children.count > 0
    node = children.shift
    if node.payload == value
      return node
    else 
      node.children.each do |child|
        children << child
      end
    end
  end
  return nil
end

# puts breadth_first_search(trunk, 11).payload

require 'minitest/autorun'

class TreeTransversalTest < Minitest::Test

  def setup
    # @fifth_node = Tree.new(5, [])
    # @eleventh_node = Tree.new(11, [])
    # @fourth_node = Tree.new(4, [])
    # @ninth_node = Tree.new(9, [@fourth_node])
    # @sixth_node = Tree.new(6, [@fifth_node, @eleventh_node])
    # @seventh_node = Tree.new(7, [@sixth_node])
    # @fifth_node = Tree.new(5, [@ninth_node])

    # # Top of the tree
    # @trunk = Tree.new(2, [@seventh_node, @fifth_node])
  end

  def test_first_search_trunk
    # assert_equal @eleventh_node, depth_first_search(@trunk, 11)
  end

end
