(pair
key: (property_identifier) @arg (#match? @arg "html")
value: (template_string) @injection.content
(#set! injection.language "html")
(#set! injection.include-children))

