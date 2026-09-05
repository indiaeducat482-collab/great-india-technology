GREAT INDIA TECHNOLOGY - SUPABASE CONNECTED WEBSITE
====================================================

Files:
- index.html              Public company website
- admin.html              Supabase Auth admin login
- admin-dashboard.html    Global content management dashboard
- assets/supabase-config.js
- assets/logo.jpg
- assets/great-india-technology-logo.jpg

IMPORTANT:
1. Open assets/supabase-config.js and paste ONLY your Supabase Publishable Key.
2. Never paste a service_role/secret key into frontend files.
3. Supabase project URL is already configured for project dfjmflwavidxfmngrwno.
4. The website reads content from Supabase, so public changes can appear on all devices.
5. Admin writes require a Supabase Auth account. Create an Auth user in Supabase Dashboard -> Authentication -> Users, then login with that email/password.
6. The existing database tables required are: site_settings, services, apps, team_members.
7. Your current SQL public-read policies are required. For secure admin writes, use authenticated RLS policies for the authenticated role only.

This package does not include any service_role key or secret.


OLD DATA RESTORE
----------------
The old editable version's default data has been prepared in supabase-seed.sql. Run that SQL once in Supabase SQL Editor. After that, the website reads the data from Supabase, so the same content is available across browsers/devices.

IMPORTANT: Apps that existed only in an old browser's Local Storage cannot be recovered from the ZIP itself. Add those apps again from the Admin Dashboard; once saved, they will be stored in Supabase and become available on every browser/device.
