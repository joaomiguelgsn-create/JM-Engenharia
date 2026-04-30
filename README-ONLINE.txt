JM Engenharia V15 Online

O que mudou:
- Continua funcionando localmente se a nuvem não estiver configurada.
- Com Supabase configurado, salva orçamentos, projetos, tarefas, financeiro e anexos em uma conta online.
- Dá para publicar na Vercel como site estático.

Passo a passo resumido:
1) Crie um projeto no Supabase.
2) No Supabase, abra SQL Editor e rode o arquivo supabase-schema.sql.
3) Em Project Settings > API, copie Project URL e anon public key.
4) Abra config.js e cole esses dois valores.
5) Publique a pasta na Vercel ou abra index.html para testar.
6) No sistema, vá em Nuvem, crie seu acesso e clique em Sincronizar agora.

Importante:
- Não coloque a service_role key no config.js. Use somente a anon public key.
- O banco usa RLS: cada usuário só lê e salva os próprios dados.
- Anexos pequenos continuam dentro do backup do sistema; para muitos PDFs grandes, o próximo passo é usar Supabase Storage.
