-- Restore the previous Great India Technology default data into Supabase.
-- Run this once in Supabase SQL Editor.

insert into public.site_settings
(company_name, tagline, description, email, phone, whatsapp, address, website)
select 'Great India Technology',
       'Technology for Business. Software for Growth.',
       'Great India Technology is a software development company focused on turning business ideas into useful, modern and scalable digital products.',
       'greatindiatechnology@gmail.com', '9006977016', '9006977016',
       'Akshy Wat, Maran Pur, Gaya Ji - 8243001', 'https://www.greatindiatechnology.com'
where not exists (select 1 from public.site_settings);

insert into public.services (title, description, icon, sort_order, is_active)
select * from (values
('Website Development','Professional business websites, portals and landing pages.','🌐',0,true),
('E-commerce Solutions','Online stores with product, order and customer features.','🛒',1,true),
('Mobile App Development','Android apps and modern web applications for business.','📱',2,true),
('Business Software','Custom software for billing, management and daily operations.','⚙️',3,true),
('Education Solutions','Coaching, school and online learning solutions.','🎓',4,true),
('Custom Projects','Tailor-made digital products built around your requirements.','🚀',5,true)
) as v(title,description,icon,sort_order,is_active)
where not exists (select 1 from public.services);

insert into public.team_members (name, designation, bio, sort_order, is_active)
select 'Great India Technology Team', 'Software & Digital Solutions',
       'Building websites, apps and business software for growing organizations.', 0, true
where not exists (select 1 from public.team_members);
