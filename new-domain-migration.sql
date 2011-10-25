-- Update common tables:

UPDATE wp_usermeta SET meta_value = replace(meta_value, 'foo.local.com', 'foo.com');

-- To update WordPress options with the new blog location, use the following SQL command:

UPDATE wp_options SET option_value = replace(option_value, 'http://foo.local.com', 'http://foo.com') WHERE option_name = 'home' OR option_name = 'siteurl';


-- After that you will need to fix URLs of the WordPress posts and pages, which translated from post slug, 
-- and stored in database wp_posts table as guid field. The URL values in this field are stored as absolute 
-- URLs instead of relative URLs, so it needs to be changed with the following SQL query:

UPDATE wp_posts SET guid = replace(guid, 'http://foo.local.com','http://foo.com');

-- If you have linked internally within blog posts or pages with absolute URLs, these links will point to wrong 
-- locations after you move the blog location. Use the following SQL commands to fix all internal links to own 
-- blog in all WordPress posts and pages:

UPDATE wp_posts SET post_content = replace(post_content, 'http://foo.local.com', 'http://foo.com');


-- If you have custom menu urls defined with absolute URLs, these links will point to wrong 
-- locations after you move the blog location. Use the following SQL commands to fix all internal menue links to own 
-- blog in all WordPress posts and pages:

UPDATE wp_postmeta SET meta_value = replace(meta_value, 'http://foo.local.com', 'http://foo.com');