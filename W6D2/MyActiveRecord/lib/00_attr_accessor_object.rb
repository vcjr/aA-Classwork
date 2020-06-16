class AttrAccessorObject
  def self.my_attr_accessor(*names) # :book_name , :library_name
    names.each do |instance_var|
      method_name ||= instance_var
      # Reader
      define_method(method_name) do
        self.instance_variable_get("@#{method_name}")
      end
      
      # Setter
      define_method("#{method_name}=") do |options|
        self.instance_variable_set("@#{method_name}", options)
      end
    end
  end

  # What it should be doing is this
  # def book_name # names[0]
  #   @book_name # self.instance_variable_get("@#{book_name}")
  # end

  # def book_name=(arg)
  #   @book_name = arg # self.instance_variable_set("@#{book_name}", arg)
  # end



  # attr_accessor :name, # has of instance variables to create setter and getter
  #for them
end
