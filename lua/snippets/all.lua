
local ls = require('luasnip')
local s = ls.snippet;
local t = ls.text_node;

ls.add_snippets( "all", {
    s("lorem", {
        t("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget nisl eget nisi iaculis mattis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam vel tortor at nisi pharetra viverra. Nam vel metus vel sapien condimentum imperdiet sit amet a odio. Aenean blandit, risus sed sollicitudin laoreet, ante odio interdum lacus, non cursus nisl lacus id dolor. Nullam in ullamcorper tellus. Donec aliquet semper massa, non accumsan ante cursus at. Ut vel arcu condimentum, rhoncus mauris quis, pellentesque quam. Integer quis orci nec nunc pellentesque vulputate vel ac ante. Duis aliquet, velit quis varius interdum, risus sem tempor velit, sit amet sollicitudin sem ante sed lorem. Nunc porta diam id nibh eleifend, quis faucibus urna fringilla. Sed at velit tellus. Quisque ac porttitor felis. Sed aliquet risus vel dolor consequat efficitur.")
    }),
})
