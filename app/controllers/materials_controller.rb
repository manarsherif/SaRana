class MaterialsController < ApplicationController
 def index
    @materials = Material.all
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)

    if @material.save
      puts "======================================"
      puts "#{Rails.root}"+"/public"+"#{@material.attachment_url}"  
      material_pages  = Grim.reap("#{Rails.root}"+"/public"+"#{@material.attachment_url}")
      count=material_pages.count

      for i in 0..(count-1)
         png   = material_pages[i].save("#{Rails.root}"+"/public"+"/uploads/pages/#{i}")
       end 

      
      #material_pages.each do |page|
       # png   = page.save("#{Rails.root}"+"/public"+"/uploads/pages/#{page.id}")
      #end 
      redirect_to materials_path, notice: "The resume #{@material.name} has been uploaded."
    else
      render "new"
    end
  end
  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_path, notice:  "The resume #{@material.name} has been deleted."
  end

private
  def material_params
    params.require(:material).permit(:name, :attachment)
  end
end
