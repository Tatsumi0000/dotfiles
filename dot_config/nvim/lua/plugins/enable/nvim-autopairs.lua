-- 自動括弧補完
return {
	{
        "windwp/nvim-autopairs" ,
        config = function()
            require("nvim-autopairs").setup({})
        end
    }
}