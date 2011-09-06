class Guy
  
   def self.speak
     puts "class method speak"
   end

   def speak
     puts '/*Guy has an instance method and he wants to tell you about the javascript prototype object?  It allows you to dynamically add methods and properties to all instances of an object. */
     function isEven(){
       if((this.length)%2){
         return false;
       } 
       else {
         return true;
       };
     };


     //custom method added to String.  
     String.prototype.even = isEven
     //custom property added to String
     String.prototype.is_a = "string" 
     console.log("fiftee".even());
     console.log("joshua".is_a);
     '
   end

end

Guy.speak
guy_instance = Guy.new
guy_instance.speak
