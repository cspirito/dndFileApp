Fileshare::Application.routes.draw do
  get "share/file"

  scope "(:locale)", :locale => /en|fr|jp/ do
    match '/save_file' => 'share#save_file'
  end

  root :to => "share#file"
end
