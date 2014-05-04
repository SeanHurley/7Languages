arr = (0..15).to_a

chunk = []
arr.each do |elem|
  chunk << elem

  if chunk.size == 4
    p chunk
    chunk = []
  end
end

p "#"*30

arr.each_slice(4) { |chunk| p chunk }

p "#"*30

class Tree
  attr_accessor :children, :node_name

  def initialize(tree={})
    raise "Too many base keys" if tree.keys.size > 1

    @children = []
    @node_name = tree.keys.first

    tree[@node_name].each do |name, subtree|
      @children << Tree.new(name => subtree)
    end
  end

  def visit_all(&block)
    visit &block
    children.each { |child| child.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end
end

nice_tree = {
  :grandpa => {
    :dad => {
      :child_1 => {},
      :child_2 => {},
    },
    :uncle => {
      :child_3 => {},
      :child_5 => {},
    }
  },
}
tree = Tree.new(nice_tree)
tree.visit_all { |node| puts node.node_name }

p "#"*30

class Grepper
  def self.grep(filename, regex)
    File.open(filename, 'r') do |file|
      file.each_line do |line|
        puts "#{filename} line #{file.lineno}: #{line}" if line.match(regex)
      end
    end
  end
end

Grepper.grep("example.txt", /string/)
p "#"*30
Grepper.grep("example.txt", /string\d{1}/)
