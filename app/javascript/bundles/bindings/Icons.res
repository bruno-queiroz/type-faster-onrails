module GoogleIcon = {
  @react.component @module("react-icons/fc")
  external make: (~className: string) => React.element = "FcGoogle"
}

module GithubIcon = {
  @react.component @module("react-icons/si")
  external make: (~className: string) => React.element = "SiGithub"
}
