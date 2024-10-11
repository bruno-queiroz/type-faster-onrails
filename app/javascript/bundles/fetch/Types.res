type user = {
  created_at: Js.Date.t,
  email: string,
  id: int,
  image: string,
  name: string,
  provider: string,
  uid: string,
  updated_at: Js.Date.t,
}

type text = {
  mode: string,
  author: string,
  id: string,
  image: string,
  text: array<string>,
  title: string,
}
