GREAT INDIA TECHNOLOGY - FIXED PROJECT

Files:
- index.html: public website
- admin.html: Supabase Auth login
- admin-dashboard.html: admin panel with image uploads through Supabase Storage
- assets/supabase-config.js: Supabase URL + public/publishable key
- assets/logo.svg: lightweight fallback logo
- supabase-fixed.sql: complete database, RLS, Storage bucket and seed setup

IMPORTANT:
1. Run supabase-fixed.sql in the SAME Supabase project configured in assets/supabase-config.js.
2. In Supabase Authentication -> Users, create the admin user.
3. Do not put a service_role/secret key into the website.
4. Image uploads are stored in the site-assets Storage bucket, not as Base64 in PostgreSQL.
5. Maximum image upload in the dashboard is 5 MB.
6. The public website reads site_settings, services and apps with anonymous read access.
7. Admin changes require a logged-in Supabase Auth user.

The original repository connector is read-only in this session, so this ZIP is a repaired upload-ready copy; it has not been pushed automatically to GitHub.
