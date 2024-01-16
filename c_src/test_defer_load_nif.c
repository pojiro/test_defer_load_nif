#include <erl_nif.h>

static int load(ErlNifEnv *env, void **priv_data, ERL_NIF_TERM load_info) {
  (void)env;
  (void)priv_data;
  (void)load_info;

  return 0;
}

static ERL_NIF_TERM test(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[]) {
  (void)env;
  (void)argc;
  (void)argv;
  return enif_make_atom(env, "ok");
}

static ErlNifFunc nif_funcs[] = {{"test", 0, test, 0}};

ERL_NIF_INIT(Elixir.TestDeferLoadNif, nif_funcs, load, NULL, NULL, NULL)
