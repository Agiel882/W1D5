class PolyTreeNode
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end 

  # This is for when self is the child 
  def parent=(new_parent) 
    parent.children.delete(self) if @parent #=> this is the old parent removing the child that is being adopted 
    @parent = new_parent #=> I have a new mommy! 
    new_parent.children << self unless @parent == nil || new_parent.children.include?(self) 
  end 

  # This is for when self is the parent 
  def add_child(child_node) 
    child_node.parent = self 
  end 

  # This is for when self is the parent 
  def remove_child(child_node) 
    unless children.include?(child_node) 
      raise "This child does not exist" 
    else 
      child_node.parent = nil 
    end 
  end
  
  def dfs(target) 
    return self if self.value == target 

    self.children.each do |child| 
      subtree_result = child.dfs(target) 
      return subtree_result unless subtree_result == nil
    end 

    nil
  end 

  def bfs(target) 
    q = Queue.new 
    q.enq(self) 

    until q.empty? 
      curr = q.deq 
      return curr if curr.value == target 
      curr.children.each { |child| q.enq(child) } 
    end 

    nil 
  end 
end 