return  {
  postgres = {
    up = [[
      DO $$
      BEGIN
        ALTER TABLE IF EXISTS ONLY "plugins" ADD "mesh_mode" TEXT UNIQUE;
      EXCEPTION WHEN DUPLICATE_COLUMN THEN
        -- Do nothing, accept existing state
      END;
      $$;

      CREATE INDEX IF NOT EXISTS "plugins_mesh_mode_idx" ON "plugins" ("mesh_mode");
    ]],
  },

  cassandra = {
    up = [[
      ALTER TABLE plugins ADD mesh_mode text;
      CREATE INDEX IF NOT EXISTS plugins_mesh_mode_idx ON routes(name);
    ]]
  }
}
