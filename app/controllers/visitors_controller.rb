 class VisitorsController < ApplicationController
   def publish
     @sections = Section.order(:ordernum)
     render 'sections/complete'
   end



   def staff_guide
     @sections=Section.where('book = ? or book = ?', 0, 1).order(:ordernum)


     respond_to do |format|
       format.html
       format.pdf do
         pdf = StaffGuide.new(@sections)
         send_data pdf.render, filename: "ACPRS_Staff_Users_Guide.pdf",
                   type: "application/pdf",
                   disposition: "inline"
       end
     end

   end




   def grantee_guide
     @impdoc=Sections.where('book = ? or book = ?', 0, 2)
   end


















 end
