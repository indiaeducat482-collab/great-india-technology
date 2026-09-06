-- GREAT INDIA TECHNOLOGY - ADMIN WRITE POLICIES
-- Run this once in Supabase SQL Editor.
-- These policies allow only logged-in Supabase Auth users to write.

alter table public.site_settings enable row level security;
alter table public.services enable row level security;
alter table public.apps enable row level security;
alter table public.team_members enable row level security;

DROP POLICY IF EXISTS "Authenticated users can insert site settings" ON public.site_settings;
DROP POLICY IF EXISTS "Authenticated users can update site settings" ON public.site_settings;
CREATE POLICY "Authenticated users can insert site settings" ON public.site_settings FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "Authenticated users can update site settings" ON public.site_settings FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated users can insert services" ON public.services;
DROP POLICY IF EXISTS "Authenticated users can update services" ON public.services;
CREATE POLICY "Authenticated users can insert services" ON public.services FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "Authenticated users can update services" ON public.services FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated users can insert apps" ON public.apps;
DROP POLICY IF EXISTS "Authenticated users can update apps" ON public.apps;
CREATE POLICY "Authenticated users can insert apps" ON public.apps FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "Authenticated users can update apps" ON public.apps FOR UPDATE TO authenticated USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated users can insert team members" ON public.team_members;
DROP POLICY IF EXISTS "Authenticated users can update team members" ON public.team_members;
CREATE POLICY "Authenticated users can insert team members" ON public.team_members FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "Authenticated users can update team members" ON public.team_members FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
