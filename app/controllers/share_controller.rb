class ShareController < ApplicationController
  def file
  end

  def save_file
	req_json = request.env['HTTP_X_QUERY_PARAMS']
	json_params = ActiveSupport::JSON.decode(req_json)
	chars = ('a'..'z').to_a + ('A'..'Z').to_a
	cstring = (0...16).collect { chars[Kernel.rand(chars.length)] }.join
	tempname = Digest::SHA1.hexdigest(cstring)
	@file_content = File.open("#{Rails.root.to_s}/tmp/#{tempname}", "wb") do |f|
		f.write(request.env['rack.input'].read)
	end
	f = Fileobj.new()
	f.name = json_params['file_name']
	f.image = File.new("#{Rails.root.to_s}/tmp/#{tempname}")
	f.save
	
	File.unlink("#{Rails.root.to_s}/tmp/#{tempname}")
        msg = f.image.url
	fname = f.name
        status = "ok"
	render :json  => {:status => status, :filename => fname, :msg => msg } and return
  end

end
