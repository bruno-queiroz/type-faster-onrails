let clear = (typingReviewIndex: int) => {
  let currentId = ref(setTimeout(_ => (), 0))
  let currentIdInt = (Obj.magic(currentId): ref<int>)

  while currentIdInt.contents > typingReviewIndex {
    clearTimeout(currentId.contents)

    currentIdInt := currentIdInt.contents - 1
  }
}
