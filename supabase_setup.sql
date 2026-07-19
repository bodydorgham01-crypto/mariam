-- شغّلي الكود ده مرة واحدة بس في Supabase → SQL Editor → Run
-- (ده مش تخزين ملفات، ده بس جدول صغير بيسجّل رابط كل ملف بعد رفعه على Cloudinary)

create table media_items (
  id bigint generated always as identity primary key,
  category text not null,
  name text,
  url text not null,
  created_at timestamptz default now()
);

alter table media_items enable row level security;

create policy "Public read"
on media_items for select
using ( true );

create policy "Public insert"
on media_items for insert
with check ( true );
