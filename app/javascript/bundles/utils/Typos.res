type typo = {
  word: string,
  typingHistoryIndex: int,
}

let set = () => {
  let set = JsSet.makeSet()
  let typos = ref([])

  let addTypo = typo => {
    if !set.has(typo.word) {
      typos.contents->Array.push(typo)
      set.add(typo.word)
    }
  }

  let clearTypos = () => {
    typos := []
    set.clear()
  }

  (() => typos, addTypo, clearTypos)
}
