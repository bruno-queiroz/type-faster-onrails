type loggingState = {isLoading: bool, provider: string}
type t = {
  loggingState: loggingState,
  handleSignInWithProvider: string => promise<unit>,
}

let useSignIn = () => {
  let (loggingState, setLoggingState) = React.useState(_ => {isLoading: false, provider: ""})

  let handleSignInWithProvider = async provider => {
    setLoggingState(_ => {isLoading: true, provider})
    let _ = await SignWithProvider.post()
    setLoggingState(_ => {isLoading: false, provider})
  }

  {
    loggingState,
    handleSignInWithProvider,
  }
}
