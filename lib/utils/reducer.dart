typedef T ReduceAction<T, J>(T prev, J current, int index);

//因为js中的reduce比较好用所以在这个地方实现一下dart的reduce方法
class Reducer {
  static T reduce<T, J>(List list, ReduceAction<T, J> action, T container) {
    T tempContainer = container;
    for (int i = 0; i < list.length; i++) {
      tempContainer = action(tempContainer, list[i], i);
    }
    return tempContainer;
  }
}
