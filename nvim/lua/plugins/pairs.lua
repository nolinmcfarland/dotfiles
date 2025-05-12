return {
	"saghen/blink.pairs",
	version = "*",
	dependencies = "saghen/blink.download",
	--- @module 'blink.pairs'
	--- @type blink.pairs.Config
	opts = {
		mappings = {
			enabled = true,
			pairs = {},
		},
		highlights = {
			enabled = true,
			groups = {
				"BlinkPairsOrange",
				"BlinkPairsPurple",
				"BlinkPairsBlue",
			},
			matchparen = {
				enabled = true,
				group = "MatchParen",
			},
		},
		debug = false,
	},
}
