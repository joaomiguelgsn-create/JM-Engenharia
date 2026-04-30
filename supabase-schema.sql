-- Rode este SQL no Supabase > SQL Editor
create table if not exists public.jm_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.jm_state enable row level security;

drop policy if exists "jm_state_select_own" on public.jm_state;
drop policy if exists "jm_state_insert_own" on public.jm_state;
drop policy if exists "jm_state_update_own" on public.jm_state;
drop policy if exists "jm_state_delete_own" on public.jm_state;

create policy "jm_state_select_own" on public.jm_state
for select using (auth.uid() = user_id);

create policy "jm_state_insert_own" on public.jm_state
for insert with check (auth.uid() = user_id);

create policy "jm_state_update_own" on public.jm_state
for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "jm_state_delete_own" on public.jm_state
for delete using (auth.uid() = user_id);
