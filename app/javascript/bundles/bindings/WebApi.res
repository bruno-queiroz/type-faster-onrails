type classList = {toggle: string => unit, add: string => unit, remove: string => unit}

type eventElement = {id: string}

type mouseEvent = {preventDefault: unit => unit, target: eventElement}

type style = {
  mutable color: string,
  mutable backgroundColor: string,
  mutable textDecoration: string,
  mutable position: string,
  mutable zIndex: string,
  mutable left: string,
}

type documentElement = {
  classList: classList,
  id: string,
  addEventListener: (string, mouseEvent => unit) => unit,
  removeEventListener: (string, mouseEvent => unit) => unit,
  value: string,
  selectionStart: option<int>,
  selectionEnd: option<int>,
  childElementCount: int,
  mutable textContent: string,
  style: style,
}

type document = {
  documentElement: documentElement,
  mutable value: string,
  focus: unit => unit,
  querySelector: string => option<documentElement>,
  createElement: string => documentElement,
  children: array<documentElement>,
}

type localStorage = {setItem: (string, string) => unit, getItem: string => option<string>}

type location = {mutable href: string}

type matchMedia = {matches: bool}

type window = {location: location, matchMedia: string => matchMedia}

type nativeEvent = {inputType: string, data: option<string>}

type event = {
  preventDefault: unit => unit,
  animationName: string,
  target: documentElement,
  nativeEvent: nativeEvent,
}

@val external document: document = "document"
@send external toggle: string => unit = "toggle"

@scope("window") @val external localStorage: localStorage = "localStorage"
@send external setItem: (string, string) => unit = "setItem"

@val external window: window = "window"
@send external matchMedia: string => matchMedia = "matchMedia"

@new external dateFromInt: int => Js.Date.t = "Date"
@new external dateFromJsDate: Js.Date.t => Js.Date.t = "Date"
type date = {getTime: unit => int}
@new external date: unit => date = "Date"

@val external event: event = "event"

@scope("window") @val external setTimeout: (unit => unit, int) => unit = "setTimeout"
