let check = (~provider, ~loggingState: SignInHook.loggingState) => {
  loggingState.provider === provider && loggingState.isLoading
}
