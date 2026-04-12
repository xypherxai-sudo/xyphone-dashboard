-- Xyphone Dashboard Setup SQL
-- Einmal in Supabase SQL Editor einfügen: https://supabase.com/dashboard/project/llrnusfadlazswgudxjt/sql

CREATE TABLE IF NOT EXISTS orders (
  id BIGSERIAL PRIMARY KEY,
  restaurant_id TEXT NOT NULL DEFAULT 'pizzeria_latina',
  kunde TEXT,
  artikel TEXT NOT NULL,
  typ TEXT DEFAULT 'lieferung',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  status TEXT DEFAULT 'neu',
  notiz TEXT
);

-- Testdaten einfügen
INSERT INTO orders (restaurant_id, kunde, artikel, typ, status) VALUES
('pizzeria_latina', 'Thomas M.', '2x Pizza Margherita, 1x Cola', 'lieferung', 'neu'),
('pizzeria_latina', 'Sarah K.', '1x Pizza Salami', 'abholung', 'neu'),
('pizzeria_latina', 'Ahmed B.', '1x Pasta Carbonara, 1x Tiramisu', 'lieferung', 'fertig');

-- RLS deaktivieren für einfachen Zugriff
ALTER TABLE orders DISABLE ROW LEVEL SECURITY;
