<?php

// config file for code formatter plugin

use PhpCsFixer\{Finder, Config};

$finder = Finder::create()->in(__DIR__);

$config = new Config();
return $config->setIndent("\t")
	->setLineEnding("\n")
	->setRules([
		'@PhpCsFixer' => true,
		'no_mixed_echo_print' => ['use' => 'echo'],
		'array_syntax' => ['syntax' => 'short'],
		'no_whitespace_before_comma_in_array' => true,
		'normalize_index_brace' => true,
		'trim_array_spaces' => true,
		'whitespace_after_comma_in_array' => true,
		'braces' => [
			'position_after_functions_and_oop_constructs' => 'same',
			'position_after_control_structures' => 'same',
			'position_after_anonymous_constructs' => 'same',
		],
		'curly_braces_position' => [
			'functions_opening_brace' => 'same_line',
			'classes_opening_brace' => 'same_line',
		],
		'no_multiple_statements_per_line' => true,
		'no_trailing_comma_in_singleline' => true,
		'constant_case' => true,
		'integer_literal_case' => true,
		'lowercase_keywords' => true,
		'lowercase_static_reference' => true,
		'magic_constant_casing' => true,
		'magic_method_casing' => true,
		'native_function_casing' => true,
		'cast_spaces' => true,
		'lowercase_cast' => true,
		'no_short_bool_cast' => true,
		'no_unset_cast' => true,
		'short_scalar_cast' => true,
		'class_attributes_separation' => [
			'elements' => [],
		],
		'class_definition' => [
			'single_line' => true,
			'single_item_single_line' => true,
			'multi_line_extends_each_single_line' => false,
			'space_before_parenthesis' => false,
			'inline_constructor_arguments' => true,
		],
		'no_blank_lines_after_class_opening' => false,
		'single_class_element_per_statement' => true,
		'multiline_comment_opening_closing' => true,
		'single_line_comment_style' => false,
		'elseif' => false,
		'include' => false,
		'no_break_comment' => false,
		'no_superfluous_elseif' => false,
		'function_declaration' => [
			'closure_function_spacing' => 'none',
			'closure_fn_spacing' => 'none',
		],
		'nullable_type_declaration_for_default_null_value' => false,
		'group_import' => true,
		'ordered_imports' => false,
		'declare_equal_normalize' => true,
		'declare_parentheses' => true,
		'list_syntax' => ['syntax' => 'short'],
		'no_leading_namespace_whitespace' => false,
		'increment_style' => ['style' => 'post'],
		'no_useless_concat_operator' => ['juggle_simple_strings' => true],
		'echo_tag_syntax' => ['format' => 'short'],
		'phpdoc_line_span' => [
			'const' => 'single',
			'property' => 'single',
			'method' => 'multi',
		],
		'phpdoc_separation' => false,
		'phpdoc_summary' => false,
		'multiline_whitespace_before_semicolons' => ['strategy' => 'no_multi_line'],
		'single_import_per_statement' => false,
		'blank_line_before_statement' => false,
		'blank_line_between_import_groups' => false, // prefer manual spacing
		'no_whitespace_in_blank_line' => false,
		'statement_indentation' => true,
	])
	->setFinder($finder);
