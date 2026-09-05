-- GREAT INDIA TECHNOLOGY - COMPLETE DATABASE + STORAGE SETUP
-- Run this entire script in Supabase SQL Editor for the project used by the website.
-- Safe frontend architecture: public read, authenticated admin write, images in Storage.

create extension if not exists pgcrypto;

create table if not exists public.site_settings (
  id integer primary key default 1,
  company_name text not null default 'Great India Technology',
  tagline text default '',
  hero_heading text default '',
  description text default '',
  email text default '',
  phone text default '',
  whatsapp text default '',
  address text default '',
  website text default '',
  company_logo_url text default '',
  updated_at timestamptz not null default now(),
  constraint site_settings_singleton check (id = 1)
);

create table if not exists public.services (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text default '',
  icon text default '🚀',
  sort_order integer not null default 0,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.apps (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text default '',
  url text default '',
  logo_url text default '',
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.team_members (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  designation text default '',
  bio text default '',
  photo_url text default '',
  sort_order integer not null default 0,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.site_settings add column if not exists hero_heading text default '';
alter table public.site_settings add column if not exists company_logo_url text default '';
alter table public.site_settings add column if not exists updated_at timestamptz not null default now();
alter table public.apps add column if not exists logo_url text default '';
alter table public.apps add column if not exists updated_at timestamptz not null default now();
alter table public.team_members add column if not exists photo_url text default '';
alter table public.team_members add column if not exists updated_at timestamptz not null default now();

insert into public.site_settings(id,company_name,tagline,hero_heading,description,email,phone,whatsapp,address,website)
values
(1,'Great India Technology','Technology for Business. Software for Growth.','Digital solutions built for growing businesses.','Great India Technology is a software development company focused on turning business ideas into useful, modern and scalable digital products.','greatindiatechnology@gmail.com','9006977016','9006977016','Akshy Wat, Maran Pur, Gaya Ji - 8243001','https://www.greatindiatechnology.com')
on conflict(id) do nothing;

insert into public.services(title,description,icon,sort_order,is_active)
select * from (values
('Website Development','Professional business websites, portals and landing pages.','🌐',0,true),
('E-commerce Solutions','Online stores with product, order and customer features.','🛒',1,true),
('Mobile App Development','Android apps and modern web applications for business.','📱',2,true),
('Business Software','Custom software for billing, management and daily operations.','⚙️',3,true),
('Education Solutions','Coaching, school and online learning solutions.','🎓',4,true),
('Custom Projects','Tailor-made digital products built around your requirements.','🚀',5,true)
) as v(title,description,icon,sort_order,is_active)
where not exists (select 1 from public.services);

alter table public.site_settings enable row level security;
alter table public.services enable row level security;
alter table public.apps enable row level security;
alter table public.team_members enable row level security;

drop policy if exists "public read site settings" on public.site_settings;
drop policy if exists "authenticated manage site settings" on public.site_settings;
create policy "public read site settings" on public.site_settings for select to anon,authenticated using (true);
create policy "authenticated manage site settings" on public.site_settings for all to authenticated using (true) with check (true);

drop policy if exists "public read services" on public.services;
drop policy if exists "authenticated manage services" on public.services;
create policy "public read services" on public.services for select to anon,authenticated using (true);
create policy "authenticated manage services" on public.services for all to authenticated using (true) with check (true);

drop policy if exists "public read apps" on public.apps;
drop policy if exists "authenticated manage apps" on public.apps;
create policy "public read apps" on public.apps for select to anon,authenticated using (true);
create policy "authenticated manage apps" on public.apps for all to authenticated using (true) with check (true);

drop policy if exists "public read team" on public.team_members;
drop policy if exists "authenticated manage team" on public.team_members;
create policy "public read team" on public.team_members for select to anon,authenticated using (true);
create policy "authenticated manage team" on public.team_members for all to authenticated using (true) with check (true);

-- Public bucket for website images. Do NOT upload secrets here.
insert into storage.buckets(id,name,public)
values ('site-assets','site-assets',true)
on conflict(id) do update set public=true;

drop policy if exists "public read site assets" on storage.objects;
drop policy if exists "authenticated upload site assets" on storage.objects;
drop policy if exists "authenticated update site assets" on storage.objects;
drop policy if exists "authenticated delete site assets" on storage.objects;

create policy "public read site assets" on storage.objects
for select to anon,authenticated using (bucket_id='site-assets');

create policy "authenticated upload site assets" on storage.objects
for insert to authenticated with check (bucket_id='site-assets');

create policy "authenticated update site assets" on storage.objects
for update to authenticated using (bucket_id='site-assets') with check (bucket_id='site-assets');

create policy "authenticated delete site assets" on storage.objects
for delete to authenticated using (bucket_id='site-assets');

-- Helpful indexes
create index if not exists services_sort_idx on public.services(sort_order);
create index if not exists apps_created_idx on public.apps(created_at desc);
create index if not exists team_sort_idx on public.team_members(sort_order);

-- Verification queries:
select id,company_name,hero_heading from public.site_settings where id=1;
select count(*) as services_count from public.services;
select count(*) as apps_count from public.apps;
select count(*) as team_count from public.team_members;
select id,name from storage.buckets where id='site-assets';
