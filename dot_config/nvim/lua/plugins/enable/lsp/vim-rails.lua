return {
	"tpope/vim-rails",
	config = function()
		-- 現在のvim-railsはrequestsのspecを良い感じに開いてくれないので、自分で設定する
		-- https://flowfx.de/blog/teach-vim-rails-about-request-specs/
		vim.cmd([[
    let g:rails_projections = {
      \ "app/controllers/*_controller.rb": {
      \   "test": [
      \     "spec/controllers/{}_controller_spec.rb",
      \     "spec/requests/{}_spec.rb"
      \   ],
      \ },
      \ "spec/requests/*_spec.rb": {
      \   "alternate": [
      \     "app/controllers/{}_controller.rb",
      \   ],
      \ },
      \ "app/services/*_service.rb": {
      \   "test": [
      \     "spec/services/{}_service_spec.rb",
      \     "spec/services/{}_spec.rb"
      \   ],
      \ },
      \ "spec/services/*_spec.rb": {
      \   "alternate": [
      \     "app/services/{}_service.rb",
      \   ],
      \ }}
  ]])
	end,
}
